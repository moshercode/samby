import { ConnectorConfig, DataConnect, OperationOptions, ExecuteOperationResponse } from 'firebase-admin/data-connect';

export const connectorConfig: ConnectorConfig;

export type TimestampString = string;
export type UUIDString = string;
export type Int64String = string;
export type DateString = string;


export interface AddAssociationConditionData {
  associationCondition_insert: {
    id: UUIDString;
  };
}

export interface AddAssociationConditionVariables {
  associationId: UUIDString;
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
  membershipId: UUIDString;
}

export interface AppUser_Key {
  id: UUIDString;
  __typename?: 'AppUser_Key';
}

export interface AssociationCondition_Key {
  id: UUIDString;
  __typename?: 'AssociationCondition_Key';
}

export interface AssociationMembership_Key {
  id: UUIDString;
  __typename?: 'AssociationMembership_Key';
}

export interface Association_Key {
  id: UUIDString;
  __typename?: 'Association_Key';
}

export interface BroadcastMessage_Key {
  id: UUIDString;
  __typename?: 'BroadcastMessage_Key';
}

export interface CalendarEventComment_Key {
  id: UUIDString;
  __typename?: 'CalendarEventComment_Key';
}

export interface CalendarEvent_Key {
  id: UUIDString;
  __typename?: 'CalendarEvent_Key';
}

export interface CreateAppUserData {
  appUser_insert: {
    id: UUIDString;
  };
}

export interface CreateAppUserVariables {
  email: string;
  name: string;
  phone: string;
}

export interface CreateAssociationData {
  association_insert: {
    id: UUIDString;
  };
}

export interface CreateAssociationVariables {
  name: string;
  shortName: string;
  subdomain: string;
  primaryColor: string;
  secondaryColor: string;
  founderEmail: string;
}

export interface CreateCalendarEventData {
  calendarEvent_insert: {
    id: UUIDString;
  };
}

export interface CreateCalendarEventVariables {
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
  associationId: UUIDString;
  title: string;
  description: string;
  imageUrl: string;
  startDate: TimestampString;
  endDate?: TimestampString | null;
  createdBy: UUIDString;
}

export interface CreateFounderMembershipData {
  associationMembership_insert: {
    id: UUIDString;
  };
}

export interface CreateFounderMembershipVariables {
  associationId: UUIDString;
  userId: UUIDString;
  userName: string;
  conditionsAcceptedAt: TimestampString;
}

export interface CreateMembershipData {
  associationMembership_insert: {
    id: UUIDString;
  };
}

export interface CreateMembershipVariables {
  associationId: UUIDString;
  userId: UUIDString;
  memberName: string;
  memberBirthDate: DateString;
  memberDNI: string;
  memberDNIImageUrl: string;
  guardianName?: string | null;
  guardianDNI?: string | null;
  guardianDNIImageUrl?: string | null;
  signatureUrl: string;
  conditionsAcceptedAt: TimestampString;
  minorConditionsAcceptedAt?: TimestampString | null;
}

export interface DeleteAssociationConditionData {
  associationCondition_delete?: {
    id: UUIDString;
  };
}

export interface DeleteAssociationConditionVariables {
  id: UUIDString;
}

export interface EventMember_Key {
  id: UUIDString;
  __typename?: 'EventMember_Key';
}

export interface Event_Key {
  id: UUIDString;
  __typename?: 'Event_Key';
}

export interface GetAssociationByFounderEmailData {
  association?: {
    id: UUIDString;
    name: string;
    shortName: string;
    subdomain: string;
    logoUrl: string;
    iconUrl: string;
    primaryColor: string;
    secondaryColor: string;
    founderEmail: string;
    createdAt: TimestampString;
  } & Association_Key;
}

export interface GetAssociationByFounderEmailVariables {
  founderEmail: string;
}

export interface GetAssociationBySubdomainData {
  association?: {
    id: UUIDString;
    name: string;
    shortName: string;
    subdomain: string;
    logoUrl: string;
    iconUrl: string;
    primaryColor: string;
    secondaryColor: string;
    founderEmail: string;
    createdAt: TimestampString;
  } & Association_Key;
}

export interface GetAssociationBySubdomainVariables {
  subdomain: string;
}

export interface GetAssociationConditionsData {
  associationConditions: ({
    id: UUIDString;
    type: string;
    content: string;
    sortOrder: number;
  } & AssociationCondition_Key)[];
}

export interface GetAssociationConditionsVariables {
  associationId: UUIDString;
}

export interface GetAssociationEventsData {
  events: ({
    id: UUIDString;
    title: string;
    description: string;
    imageUrl: string;
    startDate: TimestampString;
    endDate?: TimestampString | null;
    createdAt: TimestampString;
    eventMembers_on_event: ({
      membership: {
        id: UUIDString;
      } & AssociationMembership_Key;
    })[];
  } & Event_Key)[];
}

export interface GetAssociationEventsVariables {
  associationId: UUIDString;
}

export interface GetAssociationMembersData {
  associationMemberships: ({
    id: UUIDString;
    role: string;
    status: string;
    isBlocked: boolean;
    isFounder: boolean;
    memberName: string;
    memberBirthDate: DateString;
    memberDNI: string;
    memberDNIImageUrl: string;
    guardianName?: string | null;
    guardianDNI?: string | null;
    guardianDNIImageUrl?: string | null;
    signatureUrl: string;
    conditionsAcceptedAt: TimestampString;
    minorConditionsAcceptedAt?: TimestampString | null;
    internalNotes?: string | null;
    requestedAt: TimestampString;
    resolvedAt?: TimestampString | null;
    user: {
      id: UUIDString;
      email: string;
      name: string;
    } & AppUser_Key;
  } & AssociationMembership_Key)[];
}

export interface GetAssociationMembersVariables {
  associationId: UUIDString;
}

export interface GetEventDetailData {
  event?: {
    id: UUIDString;
    title: string;
    description: string;
    imageUrl: string;
    startDate: TimestampString;
    endDate?: TimestampString | null;
    createdAt: TimestampString;
    calendarEvents_on_event: ({
      id: UUIDString;
      title: string;
      description: string;
      eventDate: TimestampString;
      endDate?: TimestampString | null;
      createdAt: TimestampString;
    } & CalendarEvent_Key)[];
      eventMembers_on_event: ({
        id: UUIDString;
        membership: {
          id: UUIDString;
          memberName: string;
        } & AssociationMembership_Key;
      } & EventMember_Key)[];
  } & Event_Key;
}

export interface GetEventDetailVariables {
  eventId: UUIDString;
}

export interface GetManagerMembershipsData {
  associationMemberships: ({
    id: UUIDString;
    role: string;
    status: string;
    association: {
      id: UUIDString;
      name: string;
      shortName: string;
      subdomain: string;
      logoUrl: string;
      iconUrl: string;
      primaryColor: string;
      secondaryColor: string;
    } & Association_Key;
  } & AssociationMembership_Key)[];
}

export interface GetManagerMembershipsVariables {
  userId: UUIDString;
}

export interface GetMembershipData {
  associationMembership?: {
    id: UUIDString;
    role: string;
    status: string;
    isBlocked: boolean;
    isFounder: boolean;
    memberName: string;
    memberBirthDate: DateString;
    memberDNI: string;
    memberDNIImageUrl: string;
    guardianName?: string | null;
    guardianDNI?: string | null;
    guardianDNIImageUrl?: string | null;
    signatureUrl: string;
    conditionsAcceptedAt: TimestampString;
    minorConditionsAcceptedAt?: TimestampString | null;
    internalNotes?: string | null;
    requestedAt: TimestampString;
    resolvedAt?: TimestampString | null;
  } & AssociationMembership_Key;
}

export interface GetMembershipVariables {
  associationId: UUIDString;
  userId: UUIDString;
}

export interface GetUserByEmailData {
  appUsers: ({
    id: UUIDString;
    email: string;
    name: string;
    phone: string;
    createdAt: TimestampString;
  } & AppUser_Key)[];
}

export interface GetUserByEmailVariables {
  email: string;
}

export interface ResetMembershipData {
  associationMembership_update?: {
    id: UUIDString;
  };
}

export interface ResetMembershipVariables {
  id: UUIDString;
  memberName: string;
  memberBirthDate: DateString;
  memberDNI: string;
  memberDNIImageUrl: string;
  guardianName?: string | null;
  guardianDNI?: string | null;
  guardianDNIImageUrl?: string | null;
  signatureUrl: string;
  conditionsAcceptedAt: TimestampString;
  minorConditionsAcceptedAt?: TimestampString | null;
}

export interface SendBroadcastData {
  broadcastMessage_insert: {
    id: UUIDString;
  };
}

export interface SendBroadcastVariables {
  associationId: UUIDString;
  sentBy: UUIDString;
  title: string;
  body: string;
}

export interface UpdateAssociationImagesData {
  association_update?: {
    id: UUIDString;
  };
}

export interface UpdateAssociationImagesVariables {
  id: UUIDString;
  logoUrl: string;
  iconUrl: string;
}

export interface UpdateMembershipBlockData {
  associationMembership_update?: {
    id: UUIDString;
  };
}

export interface UpdateMembershipBlockVariables {
  id: UUIDString;
  isBlocked: boolean;
}

export interface UpdateMembershipNotesData {
  associationMembership_update?: {
    id: UUIDString;
  };
}

export interface UpdateMembershipNotesVariables {
  id: UUIDString;
  internalNotes: string;
}

export interface UpdateMembershipRoleData {
  associationMembership_update?: {
    id: UUIDString;
  };
}

export interface UpdateMembershipRoleVariables {
  id: UUIDString;
  role: string;
}

export interface UpdateMembershipStatusData {
  associationMembership_update?: {
    id: UUIDString;
  };
}

export interface UpdateMembershipStatusVariables {
  id: UUIDString;
  status: string;
  resolvedBy: UUIDString;
  resolvedAt: TimestampString;
}

export interface UpsertFcmTokenData {
  userFcmToken_upsert: {
    id: UUIDString;
  };
}

export interface UpsertFcmTokenVariables {
  userId: UUIDString;
  token: string;
  updatedAt: TimestampString;
}

export interface UserFcmToken_Key {
  id: UUIDString;
  __typename?: 'UserFcmToken_Key';
}

/** Generated Node Admin SDK operation action function for the 'CreateAssociation' Mutation. Allow users to execute without passing in DataConnect. */
export function createAssociation(dc: DataConnect, vars: CreateAssociationVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateAssociationData>>;
/** Generated Node Admin SDK operation action function for the 'CreateAssociation' Mutation. Allow users to pass in custom DataConnect instances. */
export function createAssociation(vars: CreateAssociationVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateAssociationData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateAssociationImages' Mutation. Allow users to execute without passing in DataConnect. */
export function updateAssociationImages(dc: DataConnect, vars: UpdateAssociationImagesVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateAssociationImagesData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateAssociationImages' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateAssociationImages(vars: UpdateAssociationImagesVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateAssociationImagesData>>;

/** Generated Node Admin SDK operation action function for the 'AddAssociationCondition' Mutation. Allow users to execute without passing in DataConnect. */
export function addAssociationCondition(dc: DataConnect, vars: AddAssociationConditionVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<AddAssociationConditionData>>;
/** Generated Node Admin SDK operation action function for the 'AddAssociationCondition' Mutation. Allow users to pass in custom DataConnect instances. */
export function addAssociationCondition(vars: AddAssociationConditionVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<AddAssociationConditionData>>;

/** Generated Node Admin SDK operation action function for the 'DeleteAssociationCondition' Mutation. Allow users to execute without passing in DataConnect. */
export function deleteAssociationCondition(dc: DataConnect, vars: DeleteAssociationConditionVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<DeleteAssociationConditionData>>;
/** Generated Node Admin SDK operation action function for the 'DeleteAssociationCondition' Mutation. Allow users to pass in custom DataConnect instances. */
export function deleteAssociationCondition(vars: DeleteAssociationConditionVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<DeleteAssociationConditionData>>;

/** Generated Node Admin SDK operation action function for the 'CreateAppUser' Mutation. Allow users to execute without passing in DataConnect. */
export function createAppUser(dc: DataConnect, vars: CreateAppUserVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateAppUserData>>;
/** Generated Node Admin SDK operation action function for the 'CreateAppUser' Mutation. Allow users to pass in custom DataConnect instances. */
export function createAppUser(vars: CreateAppUserVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateAppUserData>>;

/** Generated Node Admin SDK operation action function for the 'CreateMembership' Mutation. Allow users to execute without passing in DataConnect. */
export function createMembership(dc: DataConnect, vars: CreateMembershipVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateMembershipData>>;
/** Generated Node Admin SDK operation action function for the 'CreateMembership' Mutation. Allow users to pass in custom DataConnect instances. */
export function createMembership(vars: CreateMembershipVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateMembershipData>>;

/** Generated Node Admin SDK operation action function for the 'CreateFounderMembership' Mutation. Allow users to execute without passing in DataConnect. */
export function createFounderMembership(dc: DataConnect, vars: CreateFounderMembershipVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateFounderMembershipData>>;
/** Generated Node Admin SDK operation action function for the 'CreateFounderMembership' Mutation. Allow users to pass in custom DataConnect instances. */
export function createFounderMembership(vars: CreateFounderMembershipVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateFounderMembershipData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMembershipStatus' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMembershipStatus(dc: DataConnect, vars: UpdateMembershipStatusVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMembershipStatusData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMembershipStatus' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMembershipStatus(vars: UpdateMembershipStatusVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMembershipStatusData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMembershipRole' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMembershipRole(dc: DataConnect, vars: UpdateMembershipRoleVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMembershipRoleData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMembershipRole' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMembershipRole(vars: UpdateMembershipRoleVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMembershipRoleData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMembershipBlock' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMembershipBlock(dc: DataConnect, vars: UpdateMembershipBlockVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMembershipBlockData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMembershipBlock' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMembershipBlock(vars: UpdateMembershipBlockVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMembershipBlockData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateMembershipNotes' Mutation. Allow users to execute without passing in DataConnect. */
export function updateMembershipNotes(dc: DataConnect, vars: UpdateMembershipNotesVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMembershipNotesData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateMembershipNotes' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateMembershipNotes(vars: UpdateMembershipNotesVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateMembershipNotesData>>;

/** Generated Node Admin SDK operation action function for the 'ResetMembership' Mutation. Allow users to execute without passing in DataConnect. */
export function resetMembership(dc: DataConnect, vars: ResetMembershipVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<ResetMembershipData>>;
/** Generated Node Admin SDK operation action function for the 'ResetMembership' Mutation. Allow users to pass in custom DataConnect instances. */
export function resetMembership(vars: ResetMembershipVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<ResetMembershipData>>;

/** Generated Node Admin SDK operation action function for the 'UpsertFcmToken' Mutation. Allow users to execute without passing in DataConnect. */
export function upsertFcmToken(dc: DataConnect, vars: UpsertFcmTokenVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpsertFcmTokenData>>;
/** Generated Node Admin SDK operation action function for the 'UpsertFcmToken' Mutation. Allow users to pass in custom DataConnect instances. */
export function upsertFcmToken(vars: UpsertFcmTokenVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpsertFcmTokenData>>;

/** Generated Node Admin SDK operation action function for the 'CreateEvent' Mutation. Allow users to execute without passing in DataConnect. */
export function createEvent(dc: DataConnect, vars: CreateEventVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateEventData>>;
/** Generated Node Admin SDK operation action function for the 'CreateEvent' Mutation. Allow users to pass in custom DataConnect instances. */
export function createEvent(vars: CreateEventVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateEventData>>;

/** Generated Node Admin SDK operation action function for the 'AddEventMember' Mutation. Allow users to execute without passing in DataConnect. */
export function addEventMember(dc: DataConnect, vars: AddEventMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<AddEventMemberData>>;
/** Generated Node Admin SDK operation action function for the 'AddEventMember' Mutation. Allow users to pass in custom DataConnect instances. */
export function addEventMember(vars: AddEventMemberVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<AddEventMemberData>>;

/** Generated Node Admin SDK operation action function for the 'CreateCalendarEvent' Mutation. Allow users to execute without passing in DataConnect. */
export function createCalendarEvent(dc: DataConnect, vars: CreateCalendarEventVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateCalendarEventData>>;
/** Generated Node Admin SDK operation action function for the 'CreateCalendarEvent' Mutation. Allow users to pass in custom DataConnect instances. */
export function createCalendarEvent(vars: CreateCalendarEventVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateCalendarEventData>>;

/** Generated Node Admin SDK operation action function for the 'SendBroadcast' Mutation. Allow users to execute without passing in DataConnect. */
export function sendBroadcast(dc: DataConnect, vars: SendBroadcastVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<SendBroadcastData>>;
/** Generated Node Admin SDK operation action function for the 'SendBroadcast' Mutation. Allow users to pass in custom DataConnect instances. */
export function sendBroadcast(vars: SendBroadcastVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<SendBroadcastData>>;

/** Generated Node Admin SDK operation action function for the 'GetAssociationByFounderEmail' Query. Allow users to execute without passing in DataConnect. */
export function getAssociationByFounderEmail(dc: DataConnect, vars: GetAssociationByFounderEmailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationByFounderEmailData>>;
/** Generated Node Admin SDK operation action function for the 'GetAssociationByFounderEmail' Query. Allow users to pass in custom DataConnect instances. */
export function getAssociationByFounderEmail(vars: GetAssociationByFounderEmailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationByFounderEmailData>>;

/** Generated Node Admin SDK operation action function for the 'GetAssociationBySubdomain' Query. Allow users to execute without passing in DataConnect. */
export function getAssociationBySubdomain(dc: DataConnect, vars: GetAssociationBySubdomainVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationBySubdomainData>>;
/** Generated Node Admin SDK operation action function for the 'GetAssociationBySubdomain' Query. Allow users to pass in custom DataConnect instances. */
export function getAssociationBySubdomain(vars: GetAssociationBySubdomainVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationBySubdomainData>>;

/** Generated Node Admin SDK operation action function for the 'GetMembership' Query. Allow users to execute without passing in DataConnect. */
export function getMembership(dc: DataConnect, vars: GetMembershipVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetMembershipData>>;
/** Generated Node Admin SDK operation action function for the 'GetMembership' Query. Allow users to pass in custom DataConnect instances. */
export function getMembership(vars: GetMembershipVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetMembershipData>>;

/** Generated Node Admin SDK operation action function for the 'GetAssociationConditions' Query. Allow users to execute without passing in DataConnect. */
export function getAssociationConditions(dc: DataConnect, vars: GetAssociationConditionsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationConditionsData>>;
/** Generated Node Admin SDK operation action function for the 'GetAssociationConditions' Query. Allow users to pass in custom DataConnect instances. */
export function getAssociationConditions(vars: GetAssociationConditionsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationConditionsData>>;

/** Generated Node Admin SDK operation action function for the 'GetManagerMemberships' Query. Allow users to execute without passing in DataConnect. */
export function getManagerMemberships(dc: DataConnect, vars: GetManagerMembershipsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetManagerMembershipsData>>;
/** Generated Node Admin SDK operation action function for the 'GetManagerMemberships' Query. Allow users to pass in custom DataConnect instances. */
export function getManagerMemberships(vars: GetManagerMembershipsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetManagerMembershipsData>>;

/** Generated Node Admin SDK operation action function for the 'GetAssociationMembers' Query. Allow users to execute without passing in DataConnect. */
export function getAssociationMembers(dc: DataConnect, vars: GetAssociationMembersVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationMembersData>>;
/** Generated Node Admin SDK operation action function for the 'GetAssociationMembers' Query. Allow users to pass in custom DataConnect instances. */
export function getAssociationMembers(vars: GetAssociationMembersVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationMembersData>>;

/** Generated Node Admin SDK operation action function for the 'GetAssociationEvents' Query. Allow users to execute without passing in DataConnect. */
export function getAssociationEvents(dc: DataConnect, vars: GetAssociationEventsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationEventsData>>;
/** Generated Node Admin SDK operation action function for the 'GetAssociationEvents' Query. Allow users to pass in custom DataConnect instances. */
export function getAssociationEvents(vars: GetAssociationEventsVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAssociationEventsData>>;

/** Generated Node Admin SDK operation action function for the 'GetEventDetail' Query. Allow users to execute without passing in DataConnect. */
export function getEventDetail(dc: DataConnect, vars: GetEventDetailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetEventDetailData>>;
/** Generated Node Admin SDK operation action function for the 'GetEventDetail' Query. Allow users to pass in custom DataConnect instances. */
export function getEventDetail(vars: GetEventDetailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetEventDetailData>>;

/** Generated Node Admin SDK operation action function for the 'GetUserByEmail' Query. Allow users to execute without passing in DataConnect. */
export function getUserByEmail(dc: DataConnect, vars: GetUserByEmailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetUserByEmailData>>;
/** Generated Node Admin SDK operation action function for the 'GetUserByEmail' Query. Allow users to pass in custom DataConnect instances. */
export function getUserByEmail(vars: GetUserByEmailVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetUserByEmailData>>;

