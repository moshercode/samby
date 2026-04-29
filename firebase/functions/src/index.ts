import * as admin from 'firebase-admin';
import { onEventCreated } from './on_event_created';
import { onBroadcastCreated } from './on_broadcast_created';
import { onMembershipApproved } from './on_membership_approved';

admin.initializeApp();

export { onEventCreated, onBroadcastCreated, onMembershipApproved };
