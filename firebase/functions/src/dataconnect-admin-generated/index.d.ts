import { ConnectorConfig, DataConnect, OperationOptions, ExecuteOperationResponse } from 'firebase-admin/data-connect';

export const connectorConfig: ConnectorConfig;

export type TimestampString = string;
export type UUIDString = string;
export type Int64String = string;
export type DateString = string;

export enum EventStatus {
  ACTIVE = "ACTIVE",
  FINISHED = "FINISHED",
  CANCELLED = "CANCELLED",
}
export enum MemberRole {
  MANAGER = "MANAGER",
  MEMBER = "MEMBER",
}

export interface AddBandConditionData {
  bandCondition_insert: {
    id: UUIDString;
  };
}

export interface AddBandConditionVariables {
  bandId: UUIDString;
  type: string;
  content: string;
  sortOrder: number;
}

export interface AddEventMemberData {
  eventMember_insert: {
    id: UUIDString;
  };
}

export interface AddEventMemberVariables {
  eventId: UUIDString;
  memberId: UUIDString;
}

export interface BandCondition_Key {
  id: UUIDString;
  __typename?: 'BandCondition_Key';
}

export interface Band_Key {
  id: UUIDString;
  __typename?: 'Band_Key';
}

export interface BroadcastMessage_Key {
  id: UUIDString;
  __typename?: 'BroadcastMessage_Key';
}

export interface CreateBandData {
  band_insert: {
    id: UUIDString;
  };
}

export interface CreateBandVariables {
  name: string;
  shortName: string;
  subdomain: string;
  primaryColor: string;
  secondaryColor: string;
  founderEmail: string;
}

export interface CreateEventAppointmentData {
  eventAppointment_insert: {
    id: UUIDString;
  };
}

export interface CreateEventAppointmentVariables {
  eventId: UUIDString;
  title: string;
  description: string;
  eventDate: TimestampString;
  endDate?: TimestampString | null;
  createdBy: UUIDString;
}

export interface CreateEventData {
  event_insert: {
    id: UUIDString;
  };
}

export interface CreateEventVariables {
  bandId: UUIDString;
  title: string;
  description: string;
  imageUrl: string;
  startDate?: TimestampString | null;
  endDate?: TimestampString | null;
  freeEntry: boolean;
  entryCondition?: string | null;
  createdBy: UUIDString;
}

export interface CreateFounderMemberData {
  member_insert: {
    id: UUIDString;
  };
}

export interface CreateFounderMemberVariables {
  bandId: UUIDString;
  name: string;
  email: string;
  conditionsAcceptedAt: TimestampString;
}

export interface DeleteBandConditionData {
  bandCondition_delete?: {
    id: UUIDString;
  };
}

export interface DeleteBandConditionVariables {
  id: UUIDString;
}

export interface EventAppointmentComment_Key {
  id: UUIDString;
  __typename?: 'EventAppointmentComment_Key';
}

export interface EventAppointment_Key {
  id: UUIDString;
  __typename?: 'EventAppointment_Key';
}

export interface EventMember_Key {
  id: UUIDString;
  __typename?: 'EventMember_Key';
}

export interface Event_Key {
  id: UUIDString;
  __typename?: 'Event_Key';
}

export interface GetBandByFounderEmailData {
  band?: {
    id: UUIDString;
    name: string;
    shortName: string;
    subdomain: string;
    logoUrl: string;
    iconUrl: string;
    primaryColor: string;
    secondaryColor: string;
    founderEmail: string;
    requireIdDoc: boolean;
    requireIdDocImage: boolean;
    requireGuardian: boolean;
    active: boolean;
    createdAt: TimestampString;
  } & Band_Key;
}

export interface GetBandByFounderEmailVariables {
  founderEmail: string;
}

export interface GetBandBySubdomainData {
  band?: {
    id: UUIDString;
    name: string;
    shortName: string;
    subdomain: string;
    logoUrl: string;
    iconUrl: string;
    primaryColor: string;
    secondaryColor: string;
    founderEmail: string;
    requireIdDoc: boolean;
    requireIdDocImage: boolean;
    requireGuardian: boolean;
    active: boolean;
    createdAt: TimestampString;
  } & Band_Key;
}

export interface GetBandBySubdomainVariables {
  subdomain: string;
}

export interface GetBandConditionsData {
  bandConditions: ({
    id: UUIDString;
    type: string;
    content: string;
    sortOrder: number;
  } & BandCondition_Key)[];
}

export interface GetBandConditionsVariables {
  bandId: UUIDString;
}

export interface GetBandEventsData {
  events: ({
    id: UUIDString;
    title: string;
    description: string;
    imageUrl: string;
    startDate?: TimestampString | null;
    endDate?: TimestampString | null;
    status: EventStatus;
    freeEntry: boolean;
    entryCondition?: string | null;
    updatedAt?: TimestampString | null;
    createdAt: TimestampString;
    eventMembers_on_event: ({
      status: string;
      member: {
        id: UUIDString;
      } & Member_Key;
    })[];
  } & Event_Key)[];
}

export interface GetBandEventsVariables {
  bandId: UUIDString;
}

export interface GetBandMembersData {
  members: ({
    id: UUIDString;
    email: string;
    phone: string;
    role: MemberRole;
    status: string;
    isBlocked: boolean;
    isFounder: boolean;
    createdAt: TimestampString;
    name?: string | null;
    birthDate?: DateString | null;
    idDoc?: string | null;
    idDocImageUrl?: string | null;
    profileImageUrl?: string | null;
    guardianName?: string | null;
    guardianIdDoc?: string | null;
    guardianIdDocImageUrl?: string | null;
    signatureUrl?: string | null;
    conditionsAcceptedAt?: TimestampString | null;
    minorConditionsAcceptedAt?: TimestampString | null;
    internalNotes?: string | null;
    requestedAt?: TimestampString | null;
    resolvedAt?: TimestampString | null;
  } & Member_Key)[];
}

export interface GetBandMembersVariables {
  bandId: UUIDString;
}

export interface GetEventAppointmentDetailData {
  eventAppointment?: {
    id: UUIDString;
    event: {
      id: UUIDString;
      title: string;
    } & Event_Key;
      title: string;
      description: string;
      eventDate: TimestampString;
      endDate?: TimestampString | null;
      createdAt: TimestampString;
      eventAppointmentComments_on_eventAppointment: ({
        id: UUIDString;
        author: {
          id: UUIDString;
          name?: string | null;
          profileImageUrl?: string | null;
        } & Member_Key;
          content: string;
          imageUrls?: string | null;
          parentComment?: {
            id: UUIDString;
          } & EventAppointmentComment_Key;
            createdAt: TimestampString;
      } & EventAppointmentComment_Key)[];
  } & EventAppointment_Key;
}

export interface GetEventAppointmentDetailVariables {
  appointmentId: UUIDString;
}

export interface GetEventDetailData {
  event?: {
    id: UUIDString;
    title: string;
    description: string;
    imageUrl: string;
    startDate?: TimestampString | null;
    endDate?: TimestampString | null;
    status: EventStatus;
    freeEntry: boolean;
    entryCondition?: string | null;
    updatedAt?: TimestampString | null;
    createdAt: TimestampString;
    eventAppointments_on_event: ({
      id: UUIDString;
      title: string;
      description: string;
      eventDate: TimestampString;
      endDate?: TimestampString | null;
      createdAt: TimestampString;
    } & EventAppointment_Key)[];
      eventMembers_on_event: ({
        id: UUIDString;
        status: string;
        member: {
          id: UUIDString;
          name?: string | null;
        } & Member_Key;
      } & EventMember_Key)[];
  } & Event_Key;
}

export interface GetEventDetailVariables {
  eventId: UUIDString;
}

export interface GetEventMemberData {
  eventMembers: ({
    id: UUIDString;
    status: string;
    requestedAt?: TimestampString | null;
    resolvedAt?: TimestampString | null;
  } & EventMember_Key)[];
}

export interface GetEventMemberVariables {
  eventId: UUIDString;
  memberId: UUIDString;
}

export interface GetMemberData {
  member?: {
    id: UUIDString;
    band: {
      id: UUIDString;
    } & Band_Key;
      email: string;
      phone: string;
      role: MemberRole;
      status: string;
      isBlocked: boolean;
      isFounder: boolean;
      createdAt: TimestampString;
      name?: string | null;
      birthDate?: DateString | null;
      idDoc?: string | null;
      idDocImageUrl?: string | null;
      profileImageUrl?: string | null;
      guardianName?: string | null;
      guardianIdDoc?: string | null;
      guardianIdDocImageUrl?: string | null;
      signatureUrl?: string | null;
      conditionsAcceptedAt?: TimestampString | null;
      minorConditionsAcceptedAt?: TimestampString | null;
      internalNotes?: string | null;
      requestedAt?: TimestampString | null;
      resolvedAt?: TimestampString | null;
  } & Member_Key;
}

export interface GetMemberEventsData {
  eventMembers: ({
    event: {
      id: UUIDString;
      title: string;
      description: string;
      imageUrl: string;
      startDate?: TimestampString | null;
      endDate?: TimestampString | null;
      status: EventStatus;
      freeEntry: boolean;
      entryCondition?: string | null;
      updatedAt?: TimestampString | null;
      createdAt: TimestampString;
    } & Event_Key;
  })[];
}

export interface GetMemberEventsVariables {
  memberId: UUIDString;
}

export interface GetMemberVariables {
  memberId: UUIDString;
}

export interface Member_Key {
  id: UUIDString;
  __typename?: 'Member_Key';
}

export interface RemoveEventMemberData {
  eventMember_deleteMany: number;
}

export interface RemoveEventMemberVariables {
  eventId: UUIDString;
  memberId: UUIDString;
}

export interface RequestEventAccessData {
  eventMember_insert: {
    id: UUIDString;
  };
}

export interface RequestEventAccessVariables {
  eventId: UUIDString;
  memberId: UUIDString;
}

export interface ResetMemberApplicationData {
  member_update?: {
    id: UUIDString;
  };
}

export interface ResetMemberApplicationVariables {
  id: UUIDString;
  name: string;
  birthDate: DateString;
  idDoc: string;
  idDocImageUrl: string;
  guardianName?: string | null;
  guardianIdDoc?: string | null;
  guardianIdDocImageUrl?: string | null;
  signatureUrl: string;
  conditionsAcceptedAt: TimestampString;
  minorConditionsAcceptedAt?: TimestampString | null;
  requestedAt: TimestampString;
}

export interface ResolveEventAccessData {
  eventMember_update?: {
    id: UUIDString;
  };
}

export interface ResolveEventAccessVariables {
  id: UUIDString;
  status: string;
  resolvedBy: UUIDString;
  resolvedAt: TimestampString;
}

export interface SendBroadcastData {
  broadcastMessage_insert: {
    id: UUIDString;
  };
}

export interface SendBroadcastVariables {
  bandId: UUIDString;
  sentBy: UUIDString;
  title: string;
  body: string;
}

export interface UpdateBandData {
  band_update?: {
    id: UUIDString;
  };
}

export interface UpdateBandImagesData {
  band_update?: {
    id: UUIDString;
  };
}

export interface UpdateBandImagesVariables {
  id: UUIDString;
  logoUrl: string;
  iconUrl: string;
}

export interface UpdateBandVariables {
  id: UUIDString;
  requireIdDoc: boolean;
  requireIdDocImage: boolean;
  requireGuardian: boolean;
}

export interface UpdateEventStatusData {
  event_update?: {
    id: UUIDString;
  };
}

export interface UpdateEventStatusVariables {
  id: UUIDString;
  status: EventStatus;
  updatedAt: TimestampString;
}

export interface UpdateMemberApplicationData {
  member_update?: {
    id: UUIDString;
  };
}

export interface UpdateMemberApplicationVariables {
  id: UUIDString;
  name: string;
  birthDate: DateString;
  idDoc: string;
  idDocImageUrl: string;
  guardianName?: string | null;
  guardianIdDoc?: string | null;
  guardianIdDocImageUrl?: string | null;
  signatureUrl: string;
  conditionsAcceptedAt: TimestampString;
  minorConditionsAcceptedAt?: TimestampString | null;
  requestedAt: TimestampString;
}

export interface UpdateMemberBlockData {
  member_update?: {
    id: UUIDString;
  };
}

export interface UpdateMemberBlockVariables {
  id: UUIDString;
  isBlocked: boolean;
}

export interface UpdateMemberFcmTokenData {
  member_update?: {
    id: UUIDString;
  };
}

export interface UpdateMemberFcmTokenVariables {
  id: UUIDString;
  token: string;
  updatedAt: TimestampString;
}

export interface UpdateMemberNotesData {
  member_update?: {
    id: UUIDString;
  };
}

export interface UpdateMemberNotesVariables {
  id: UUIDString;
  internalNotes: string;
}

export interface UpdateMemberRoleData {
  member_update?: {
    id: UUIDString;
  };
}

export interface UpdateMemberRoleVariables {
  id: UUIDString;
  role: MemberRole;
}

export interface UpdateMemberStatusData {
  member_update?: {
    id: UUIDString;
  };
}

export interface UpdateMemberStatusVariables {
  id: UUIDString;
  status: string;
  resolvedBy: UUIDString;
  resolvedAt: TimestampString;
}

/** Generated Node Admin SDK operation action function for the 'CreateBand' Mutation. Allow users to execute without passing in DataConnect. */
export function createBand(dc: DataConnect, vars: CreateBandVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateBandData>>;
/** Generated Node Admin SDK operation action function for the 'CreateBand' Mutation. Allow users to pass in custom DataConnect instances. */
export function createBand(vars: CreateBandVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateBandData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateBandImages' Mutation. Allow users to execute without passing in DataConnect. */
export function updateBandImages(dc: DataConnect, vars: UpdateBandImagesVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateBandImagesData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateBandImages' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateBandImages(vars: UpdateBandImagesVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateBandImagesData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateBand' Mutation. Allow users to execute without passing in DataConnect. */
export function updateBand(dc: DataConnect, vars: UpdateBandVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateBandData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateBand' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateBand(vars: UpdateBandVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateBandData>>;

/** Generated Node Admin SDK operation action function for the 'AddBandCondition' Mutation. Allow users to execute without passing in DataConnect. */
export function addBandCondition(dc: DataConnect, vars: AddBandConditionVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<AddBandConditionData>>;
/** Generated Node Admin SDK operation action function for the 'AddBandCondition' Mutation. Allow users to pass in custom DataConnect instances. */
export function addBandCondition(vars: AddBandConditionVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<AddBandConditionData>>;

/** Generated Node Admin SDK operation action function for the 'DeleteBandCondition' Mutation. Allow users to execute without passing in DataConnect. */
export function deleteBandCondition(dc: DataConnect, vars: DeleteBandConditionVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<DeleteBandConditionData>>;
/** Generated Node Admin SDK operation action function for the 'DeleteBandCondition' Mutation. Allow users to pass in custom DataConnect instances. */
export function deleteBandCondition(vars: DeleteBandConditionVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<DeleteBandConditionData>>;

/** Generated Node Admin SDK operation action function for the 'CreateFounderMember' Mutation. Allow users to execute without passing in DataConnect. */
export function createFounderMember(dc: DataConnect, vars: CreateFounderMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateFounderMemberData>>;
/** Generated Node Admin SDK operation action function for the 'CreateFounderMember' Mutation. Allow users to pass in custom DataConnect instances. */
export function createFounderMember(vars: CreateFounderMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateFounderMemberData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMemberApplication' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMemberApplication(dc: DataConnect, vars: UpdateMemberApplicationVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberApplicationData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMemberApplication' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMemberApplication(vars: UpdateMemberApplicationVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberApplicationData>>;

/** Generated Node Admin SDK operation action function for the 'ResetMemberApplication' Mutation. Allow users to execute without passing in DataConnect. */
export function resetMemberApplication(dc: DataConnect, vars: ResetMemberApplicationVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<ResetMemberApplicationData>>;
/** Generated Node Admin SDK operation action function for the 'ResetMemberApplication' Mutation. Allow users to pass in custom DataConnect instances. */
export function resetMemberApplication(vars: ResetMemberApplicationVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<ResetMemberApplicationData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMemberStatus' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMemberStatus(dc: DataConnect, vars: UpdateMemberStatusVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberStatusData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMemberStatus' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMemberStatus(vars: UpdateMemberStatusVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberStatusData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMemberRole' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMemberRole(dc: DataConnect, vars: UpdateMemberRoleVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberRoleData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMemberRole' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMemberRole(vars: UpdateMemberRoleVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberRoleData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMemberBlock' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMemberBlock(dc: DataConnect, vars: UpdateMemberBlockVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberBlockData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMemberBlock' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMemberBlock(vars: UpdateMemberBlockVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberBlockData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMemberNotes' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMemberNotes(dc: DataConnect, vars: UpdateMemberNotesVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberNotesData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMemberNotes' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMemberNotes(vars: UpdateMemberNotesVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberNotesData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMemberFcmToken' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMemberFcmToken(dc: DataConnect, vars: UpdateMemberFcmTokenVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberFcmTokenData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMemberFcmToken' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMemberFcmToken(vars: UpdateMemberFcmTokenVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMemberFcmTokenData>>;

/** Generated Node Admin SDK operation action function for the 'CreateEvent' Mutation. Allow users to execute without passing in DataConnect. */
export function createEvent(dc: DataConnect, vars: CreateEventVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateEventData>>;
/** Generated Node Admin SDK operation action function for the 'CreateEvent' Mutation. Allow users to pass in custom DataConnect instances. */
export function createEvent(vars: CreateEventVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateEventData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateEventStatus' Mutation. Allow users to execute without passing in DataConnect. */
export function updateEventStatus(dc: DataConnect, vars: UpdateEventStatusVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateEventStatusData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateEventStatus' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateEventStatus(vars: UpdateEventStatusVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateEventStatusData>>;

/** Generated Node Admin SDK operation action function for the 'AddEventMember' Mutation. Allow users to execute without passing in DataConnect. */
export function addEventMember(dc: DataConnect, vars: AddEventMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<AddEventMemberData>>;
/** Generated Node Admin SDK operation action function for the 'AddEventMember' Mutation. Allow users to pass in custom DataConnect instances. */
export function addEventMember(vars: AddEventMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<AddEventMemberData>>;

/** Generated Node Admin SDK operation action function for the 'RemoveEventMember' Mutation. Allow users to execute without passing in DataConnect. */
export function removeEventMember(dc: DataConnect, vars: RemoveEventMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<RemoveEventMemberData>>;
/** Generated Node Admin SDK operation action function for the 'RemoveEventMember' Mutation. Allow users to pass in custom DataConnect instances. */
export function removeEventMember(vars: RemoveEventMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<RemoveEventMemberData>>;

/** Generated Node Admin SDK operation action function for the 'RequestEventAccess' Mutation. Allow users to execute without passing in DataConnect. */
export function requestEventAccess(dc: DataConnect, vars: RequestEventAccessVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<RequestEventAccessData>>;
/** Generated Node Admin SDK operation action function for the 'RequestEventAccess' Mutation. Allow users to pass in custom DataConnect instances. */
export function requestEventAccess(vars: RequestEventAccessVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<RequestEventAccessData>>;

/** Generated Node Admin SDK operation action function for the 'ResolveEventAccess' Mutation. Allow users to execute without passing in DataConnect. */
export function resolveEventAccess(dc: DataConnect, vars: ResolveEventAccessVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<ResolveEventAccessData>>;
/** Generated Node Admin SDK operation action function for the 'ResolveEventAccess' Mutation. Allow users to pass in custom DataConnect instances. */
export function resolveEventAccess(vars: ResolveEventAccessVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<ResolveEventAccessData>>;

/** Generated Node Admin SDK operation action function for the 'CreateEventAppointment' Mutation. Allow users to execute without passing in DataConnect. */
export function createEventAppointment(dc: DataConnect, vars: CreateEventAppointmentVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateEventAppointmentData>>;
/** Generated Node Admin SDK operation action function for the 'CreateEventAppointment' Mutation. Allow users to pass in custom DataConnect instances. */
export function createEventAppointment(vars: CreateEventAppointmentVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateEventAppointmentData>>;

/** Generated Node Admin SDK operation action function for the 'SendBroadcast' Mutation. Allow users to execute without passing in DataConnect. */
export function sendBroadcast(dc: DataConnect, vars: SendBroadcastVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<SendBroadcastData>>;
/** Generated Node Admin SDK operation action function for the 'SendBroadcast' Mutation. Allow users to pass in custom DataConnect instances. */
export function sendBroadcast(vars: SendBroadcastVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<SendBroadcastData>>;

/** Generated Node Admin SDK operation action function for the 'GetBandByFounderEmail' Query. Allow users to execute without passing in DataConnect. */
export function getBandByFounderEmail(dc: DataConnect, vars: GetBandByFounderEmailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandByFounderEmailData>>;
/** Generated Node Admin SDK operation action function for the 'GetBandByFounderEmail' Query. Allow users to pass in custom DataConnect instances. */
export function getBandByFounderEmail(vars: GetBandByFounderEmailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandByFounderEmailData>>;

/** Generated Node Admin SDK operation action function for the 'GetBandBySubdomain' Query. Allow users to execute without passing in DataConnect. */
export function getBandBySubdomain(dc: DataConnect, vars: GetBandBySubdomainVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandBySubdomainData>>;
/** Generated Node Admin SDK operation action function for the 'GetBandBySubdomain' Query. Allow users to pass in custom DataConnect instances. */
export function getBandBySubdomain(vars: GetBandBySubdomainVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandBySubdomainData>>;

/** Generated Node Admin SDK operation action function for the 'GetMember' Query. Allow users to execute without passing in DataConnect. */
export function getMember(dc: DataConnect, vars: GetMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetMemberData>>;
/** Generated Node Admin SDK operation action function for the 'GetMember' Query. Allow users to pass in custom DataConnect instances. */
export function getMember(vars: GetMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetMemberData>>;

/** Generated Node Admin SDK operation action function for the 'GetBandConditions' Query. Allow users to execute without passing in DataConnect. */
export function getBandConditions(dc: DataConnect, vars: GetBandConditionsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandConditionsData>>;
/** Generated Node Admin SDK operation action function for the 'GetBandConditions' Query. Allow users to pass in custom DataConnect instances. */
export function getBandConditions(vars: GetBandConditionsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandConditionsData>>;

/** Generated Node Admin SDK operation action function for the 'GetBandMembers' Query. Allow users to execute without passing in DataConnect. */
export function getBandMembers(dc: DataConnect, vars: GetBandMembersVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandMembersData>>;
/** Generated Node Admin SDK operation action function for the 'GetBandMembers' Query. Allow users to pass in custom DataConnect instances. */
export function getBandMembers(vars: GetBandMembersVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandMembersData>>;

/** Generated Node Admin SDK operation action function for the 'GetBandEvents' Query. Allow users to execute without passing in DataConnect. */
export function getBandEvents(dc: DataConnect, vars: GetBandEventsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandEventsData>>;
/** Generated Node Admin SDK operation action function for the 'GetBandEvents' Query. Allow users to pass in custom DataConnect instances. */
export function getBandEvents(vars: GetBandEventsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetBandEventsData>>;

/** Generated Node Admin SDK operation action function for the 'GetEventDetail' Query. Allow users to execute without passing in DataConnect. */
export function getEventDetail(dc: DataConnect, vars: GetEventDetailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetEventDetailData>>;
/** Generated Node Admin SDK operation action function for the 'GetEventDetail' Query. Allow users to pass in custom DataConnect instances. */
export function getEventDetail(vars: GetEventDetailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetEventDetailData>>;

/** Generated Node Admin SDK operation action function for the 'GetMemberEvents' Query. Allow users to execute without passing in DataConnect. */
export function getMemberEvents(dc: DataConnect, vars: GetMemberEventsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetMemberEventsData>>;
/** Generated Node Admin SDK operation action function for the 'GetMemberEvents' Query. Allow users to pass in custom DataConnect instances. */
export function getMemberEvents(vars: GetMemberEventsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetMemberEventsData>>;

/** Generated Node Admin SDK operation action function for the 'GetEventMember' Query. Allow users to execute without passing in DataConnect. */
export function getEventMember(dc: DataConnect, vars: GetEventMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetEventMemberData>>;
/** Generated Node Admin SDK operation action function for the 'GetEventMember' Query. Allow users to pass in custom DataConnect instances. */
export function getEventMember(vars: GetEventMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetEventMemberData>>;

/** Generated Node Admin SDK operation action function for the 'GetEventAppointmentDetail' Query. Allow users to execute without passing in DataConnect. */
export function getEventAppointmentDetail(dc: DataConnect, vars: GetEventAppointmentDetailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetEventAppointmentDetailData>>;
/** Generated Node Admin SDK operation action function for the 'GetEventAppointmentDetail' Query. Allow users to pass in custom DataConnect instances. */
export function getEventAppointmentDetail(vars: GetEventAppointmentDetailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetEventAppointmentDetailData>>;

