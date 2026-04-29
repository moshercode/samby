import * as admin from 'firebase-admin';
import { onDocumentUpdated } from 'firebase-functions/v2/firestore';

// Triggered when an AssociationMembership status changes to 'approved'.
// Sends FCM to the affected user.
export const onMembershipApproved = onDocumentUpdated(
  { document: 'associationMemberships/{membershipId}', region: 'europe-west1' },
  async (event) => {
    const before = event.data?.before.data();
    const after = event.data?.after.data();
    if (!before || !after) return;

    const wasApproved = before.status !== 'approved' && after.status === 'approved';
    if (!wasApproved) return;

    const userId: string = after.userId;
    const db = admin.firestore();

    const tokensSnap = await db
      .collection('userFCMTokens')
      .where('userId', '==', userId)
      .get();

    const tokens = tokensSnap.docs.map((doc) => doc.data().token as string).filter(Boolean);
    if (tokens.length === 0) return;

    await admin.messaging().sendEachForMulticast({
      tokens,
      notification: {
        title: '¡Solicitud aceptada!',
        body: 'Tu solicitud de membresía ha sido aceptada.',
      },
      data: {
        type: 'membership_approved',
        membershipId: event.params.membershipId,
      },
    });
  }
);
