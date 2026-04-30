import * as admin from 'firebase-admin';
import { onEventCreated } from './on_event_created';
import { onBroadcastCreated } from './on_broadcast_created';
import { memberLogin } from './member_login';
import { memberRegister } from './member_register';
import { memberRequestPasswordReset } from './member_request_password_reset';
import { memberResetPassword } from './member_reset_password';

admin.initializeApp();

export {
  onEventCreated,
  onBroadcastCreated,
  memberLogin,
  memberRegister,
  memberRequestPasswordReset,
  memberResetPassword,
};
