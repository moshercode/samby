import * as admin from 'firebase-admin';

admin.initializeApp();

export { clientRegister } from './client_register';
export { clientLogin } from './client_login';
export { clientRequestPasswordReset } from './client_request_password_reset';
export { clientResetPassword } from './client_reset_password';
export { getAvailableSlots } from './get_available_slots';
export { createAppointment } from './create_appointment';
