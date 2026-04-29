import * as admin from 'firebase-admin';
import { onDocumentCreated } from 'firebase-functions/v2/firestore';

// Triggered when a new Event is created in Data Connect.
// Sends FCM to all approved members and managers of the association.
export const onEventCreated = onDocumentCreated(
  { document: 'events/{eventId}', region: 'europe-west1' },
  async (event) => {
    const data = event.data?.data();
    if (!data) return;

    const associationId: string = data.associationId;
    const title: string = data.title;

    const fcmTokens = await _getAssociationFCMTokens(associationId);
    if (fcmTokens.length === 0) return;

    await _sendMulticast(fcmTokens, {
      title: 'Nuevo evento',
      body: title,
      data: { type: 'event', eventId: event.params.eventId, associationId },
    });
  }
);

async function _getAssociationFCMTokens(associationId: string): Promise<string[]> {
  const db = admin.firestore();
  const membershipsSnap = await db
    .collection('associationMemberships')
    .where('associationId', '==', associationId)
    .where('status', '==', 'approved')
    .get();

  const userIds = membershipsSnap.docs.map((doc) => doc.data().userId as string);
  if (userIds.length === 0) return [];

  const tokensSnap = await db
    .collection('userFCMTokens')
    .where('userId', 'in', userIds)
    .get();

  return tokensSnap.docs.map((doc) => doc.data().token as string).filter(Boolean);
}

async function _sendMulticast(
  tokens: string[],
  notification: { title: string; body: string; data?: Record<string, string> }
): Promise<void> {
  const chunkSize = 500;
  for (let i = 0; i < tokens.length; i += chunkSize) {
    const chunk = tokens.slice(i, i + chunkSize);
    await admin.messaging().sendEachForMulticast({
      tokens: chunk,
      notification: { title: notification.title, body: notification.body },
      data: notification.data,
    });
  }
}
