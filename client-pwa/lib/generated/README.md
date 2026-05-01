# samby SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
SambyConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetBandByFounderEmail
#### Required Arguments
```dart
String founderEmail = ...;
SambyConnector.instance.getBandByFounderEmail(
  founderEmail: founderEmail,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetBandByFounderEmailData, GetBandByFounderEmailVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getBandByFounderEmail(
  founderEmail: founderEmail,
);
GetBandByFounderEmailData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String founderEmail = ...;

final ref = SambyConnector.instance.getBandByFounderEmail(
  founderEmail: founderEmail,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetBandBySubdomain
#### Required Arguments
```dart
String subdomain = ...;
SambyConnector.instance.getBandBySubdomain(
  subdomain: subdomain,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetBandBySubdomainData, GetBandBySubdomainVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getBandBySubdomain(
  subdomain: subdomain,
);
GetBandBySubdomainData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String subdomain = ...;

final ref = SambyConnector.instance.getBandBySubdomain(
  subdomain: subdomain,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetMember
#### Required Arguments
```dart
String memberId = ...;
SambyConnector.instance.getMember(
  memberId: memberId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetMemberData, GetMemberVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getMember(
  memberId: memberId,
);
GetMemberData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String memberId = ...;

final ref = SambyConnector.instance.getMember(
  memberId: memberId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetBandConditions
#### Required Arguments
```dart
String bandId = ...;
SambyConnector.instance.getBandConditions(
  bandId: bandId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetBandConditionsData, GetBandConditionsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getBandConditions(
  bandId: bandId,
);
GetBandConditionsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String bandId = ...;

final ref = SambyConnector.instance.getBandConditions(
  bandId: bandId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetBandMembers
#### Required Arguments
```dart
String bandId = ...;
SambyConnector.instance.getBandMembers(
  bandId: bandId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetBandMembersData, GetBandMembersVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getBandMembers(
  bandId: bandId,
);
GetBandMembersData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String bandId = ...;

final ref = SambyConnector.instance.getBandMembers(
  bandId: bandId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetBandEvents
#### Required Arguments
```dart
String bandId = ...;
SambyConnector.instance.getBandEvents(
  bandId: bandId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetBandEventsData, GetBandEventsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getBandEvents(
  bandId: bandId,
);
GetBandEventsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String bandId = ...;

final ref = SambyConnector.instance.getBandEvents(
  bandId: bandId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetEventDetail
#### Required Arguments
```dart
String eventId = ...;
SambyConnector.instance.getEventDetail(
  eventId: eventId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetEventDetailData, GetEventDetailVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getEventDetail(
  eventId: eventId,
);
GetEventDetailData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String eventId = ...;

final ref = SambyConnector.instance.getEventDetail(
  eventId: eventId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetMemberEvents
#### Required Arguments
```dart
String memberId = ...;
SambyConnector.instance.getMemberEvents(
  memberId: memberId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetMemberEventsData, GetMemberEventsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getMemberEvents(
  memberId: memberId,
);
GetMemberEventsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String memberId = ...;

final ref = SambyConnector.instance.getMemberEvents(
  memberId: memberId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetEventMember
#### Required Arguments
```dart
String eventId = ...;
String memberId = ...;
SambyConnector.instance.getEventMember(
  eventId: eventId,
  memberId: memberId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetEventMemberData, GetEventMemberVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getEventMember(
  eventId: eventId,
  memberId: memberId,
);
GetEventMemberData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String eventId = ...;
String memberId = ...;

final ref = SambyConnector.instance.getEventMember(
  eventId: eventId,
  memberId: memberId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetEventAppointmentDetail
#### Required Arguments
```dart
String appointmentId = ...;
SambyConnector.instance.getEventAppointmentDetail(
  appointmentId: appointmentId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetEventAppointmentDetailData, GetEventAppointmentDetailVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await SambyConnector.instance.getEventAppointmentDetail(
  appointmentId: appointmentId,
);
GetEventAppointmentDetailData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String appointmentId = ...;

final ref = SambyConnector.instance.getEventAppointmentDetail(
  appointmentId: appointmentId,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateBand
#### Required Arguments
```dart
String name = ...;
String shortName = ...;
String subdomain = ...;
String primaryColor = ...;
String secondaryColor = ...;
String founderEmail = ...;
SambyConnector.instance.createBand(
  name: name,
  shortName: shortName,
  subdomain: subdomain,
  primaryColor: primaryColor,
  secondaryColor: secondaryColor,
  founderEmail: founderEmail,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateBandData, CreateBandVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.createBand(
  name: name,
  shortName: shortName,
  subdomain: subdomain,
  primaryColor: primaryColor,
  secondaryColor: secondaryColor,
  founderEmail: founderEmail,
);
CreateBandData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String name = ...;
String shortName = ...;
String subdomain = ...;
String primaryColor = ...;
String secondaryColor = ...;
String founderEmail = ...;

final ref = SambyConnector.instance.createBand(
  name: name,
  shortName: shortName,
  subdomain: subdomain,
  primaryColor: primaryColor,
  secondaryColor: secondaryColor,
  founderEmail: founderEmail,
).ref();
ref.execute();
```


### UpdateBandImages
#### Required Arguments
```dart
String id = ...;
String logoUrl = ...;
String iconUrl = ...;
SambyConnector.instance.updateBandImages(
  id: id,
  logoUrl: logoUrl,
  iconUrl: iconUrl,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateBandImagesData, UpdateBandImagesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.updateBandImages(
  id: id,
  logoUrl: logoUrl,
  iconUrl: iconUrl,
);
UpdateBandImagesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String logoUrl = ...;
String iconUrl = ...;

final ref = SambyConnector.instance.updateBandImages(
  id: id,
  logoUrl: logoUrl,
  iconUrl: iconUrl,
).ref();
ref.execute();
```


### UpdateBand
#### Required Arguments
```dart
String id = ...;
bool requireIdDoc = ...;
bool requireIdDocImage = ...;
bool requireGuardian = ...;
SambyConnector.instance.updateBand(
  id: id,
  requireIdDoc: requireIdDoc,
  requireIdDocImage: requireIdDocImage,
  requireGuardian: requireGuardian,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateBandData, UpdateBandVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.updateBand(
  id: id,
  requireIdDoc: requireIdDoc,
  requireIdDocImage: requireIdDocImage,
  requireGuardian: requireGuardian,
);
UpdateBandData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
bool requireIdDoc = ...;
bool requireIdDocImage = ...;
bool requireGuardian = ...;

final ref = SambyConnector.instance.updateBand(
  id: id,
  requireIdDoc: requireIdDoc,
  requireIdDocImage: requireIdDocImage,
  requireGuardian: requireGuardian,
).ref();
ref.execute();
```


### AddBandCondition
#### Required Arguments
```dart
String bandId = ...;
String type = ...;
String content = ...;
int sortOrder = ...;
SambyConnector.instance.addBandCondition(
  bandId: bandId,
  type: type,
  content: content,
  sortOrder: sortOrder,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<AddBandConditionData, AddBandConditionVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.addBandCondition(
  bandId: bandId,
  type: type,
  content: content,
  sortOrder: sortOrder,
);
AddBandConditionData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String bandId = ...;
String type = ...;
String content = ...;
int sortOrder = ...;

final ref = SambyConnector.instance.addBandCondition(
  bandId: bandId,
  type: type,
  content: content,
  sortOrder: sortOrder,
).ref();
ref.execute();
```


### DeleteBandCondition
#### Required Arguments
```dart
String id = ...;
SambyConnector.instance.deleteBandCondition(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<DeleteBandConditionData, DeleteBandConditionVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.deleteBandCondition(
  id: id,
);
DeleteBandConditionData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = SambyConnector.instance.deleteBandCondition(
  id: id,
).ref();
ref.execute();
```


### CreateFounderMember
#### Required Arguments
```dart
String bandId = ...;
String name = ...;
String email = ...;
Timestamp conditionsAcceptedAt = ...;
SambyConnector.instance.createFounderMember(
  bandId: bandId,
  name: name,
  email: email,
  conditionsAcceptedAt: conditionsAcceptedAt,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateFounderMemberData, CreateFounderMemberVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.createFounderMember(
  bandId: bandId,
  name: name,
  email: email,
  conditionsAcceptedAt: conditionsAcceptedAt,
);
CreateFounderMemberData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String bandId = ...;
String name = ...;
String email = ...;
Timestamp conditionsAcceptedAt = ...;

final ref = SambyConnector.instance.createFounderMember(
  bandId: bandId,
  name: name,
  email: email,
  conditionsAcceptedAt: conditionsAcceptedAt,
).ref();
ref.execute();
```


### UpdateMemberApplication
#### Required Arguments
```dart
String id = ...;
String name = ...;
DateTime birthDate = ...;
String idDoc = ...;
String idDocImageUrl = ...;
String signatureUrl = ...;
Timestamp conditionsAcceptedAt = ...;
Timestamp requestedAt = ...;
SambyConnector.instance.updateMemberApplication(
  id: id,
  name: name,
  birthDate: birthDate,
  idDoc: idDoc,
  idDocImageUrl: idDocImageUrl,
  signatureUrl: signatureUrl,
  conditionsAcceptedAt: conditionsAcceptedAt,
  requestedAt: requestedAt,
).execute();
```

#### Optional Arguments
We return a builder for each query. For UpdateMemberApplication, we created `UpdateMemberApplicationBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class UpdateMemberApplicationVariablesBuilder {
  ...
   UpdateMemberApplicationVariablesBuilder guardianName(String? t) {
   _guardianName.value = t;
   return this;
  }
  UpdateMemberApplicationVariablesBuilder guardianIdDoc(String? t) {
   _guardianIdDoc.value = t;
   return this;
  }
  UpdateMemberApplicationVariablesBuilder guardianIdDocImageUrl(String? t) {
   _guardianIdDocImageUrl.value = t;
   return this;
  }
  UpdateMemberApplicationVariablesBuilder minorConditionsAcceptedAt(Timestamp? t) {
   _minorConditionsAcceptedAt.value = t;
   return this;
  }

  ...
}
SambyConnector.instance.updateMemberApplication(
  id: id,
  name: name,
  birthDate: birthDate,
  idDoc: idDoc,
  idDocImageUrl: idDocImageUrl,
  signatureUrl: signatureUrl,
  conditionsAcceptedAt: conditionsAcceptedAt,
  requestedAt: requestedAt,
)
.guardianName(guardianName)
.guardianIdDoc(guardianIdDoc)
.guardianIdDocImageUrl(guardianIdDocImageUrl)
.minorConditionsAcceptedAt(minorConditionsAcceptedAt)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<UpdateMemberApplicationData, UpdateMemberApplicationVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.updateMemberApplication(
  id: id,
  name: name,
  birthDate: birthDate,
  idDoc: idDoc,
  idDocImageUrl: idDocImageUrl,
  signatureUrl: signatureUrl,
  conditionsAcceptedAt: conditionsAcceptedAt,
  requestedAt: requestedAt,
);
UpdateMemberApplicationData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String name = ...;
DateTime birthDate = ...;
String idDoc = ...;
String idDocImageUrl = ...;
String signatureUrl = ...;
Timestamp conditionsAcceptedAt = ...;
Timestamp requestedAt = ...;

final ref = SambyConnector.instance.updateMemberApplication(
  id: id,
  name: name,
  birthDate: birthDate,
  idDoc: idDoc,
  idDocImageUrl: idDocImageUrl,
  signatureUrl: signatureUrl,
  conditionsAcceptedAt: conditionsAcceptedAt,
  requestedAt: requestedAt,
).ref();
ref.execute();
```


### ResetMemberApplication
#### Required Arguments
```dart
String id = ...;
String name = ...;
DateTime birthDate = ...;
String idDoc = ...;
String idDocImageUrl = ...;
String signatureUrl = ...;
Timestamp conditionsAcceptedAt = ...;
Timestamp requestedAt = ...;
SambyConnector.instance.resetMemberApplication(
  id: id,
  name: name,
  birthDate: birthDate,
  idDoc: idDoc,
  idDocImageUrl: idDocImageUrl,
  signatureUrl: signatureUrl,
  conditionsAcceptedAt: conditionsAcceptedAt,
  requestedAt: requestedAt,
).execute();
```

#### Optional Arguments
We return a builder for each query. For ResetMemberApplication, we created `ResetMemberApplicationBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ResetMemberApplicationVariablesBuilder {
  ...
   ResetMemberApplicationVariablesBuilder guardianName(String? t) {
   _guardianName.value = t;
   return this;
  }
  ResetMemberApplicationVariablesBuilder guardianIdDoc(String? t) {
   _guardianIdDoc.value = t;
   return this;
  }
  ResetMemberApplicationVariablesBuilder guardianIdDocImageUrl(String? t) {
   _guardianIdDocImageUrl.value = t;
   return this;
  }
  ResetMemberApplicationVariablesBuilder minorConditionsAcceptedAt(Timestamp? t) {
   _minorConditionsAcceptedAt.value = t;
   return this;
  }

  ...
}
SambyConnector.instance.resetMemberApplication(
  id: id,
  name: name,
  birthDate: birthDate,
  idDoc: idDoc,
  idDocImageUrl: idDocImageUrl,
  signatureUrl: signatureUrl,
  conditionsAcceptedAt: conditionsAcceptedAt,
  requestedAt: requestedAt,
)
.guardianName(guardianName)
.guardianIdDoc(guardianIdDoc)
.guardianIdDocImageUrl(guardianIdDocImageUrl)
.minorConditionsAcceptedAt(minorConditionsAcceptedAt)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<ResetMemberApplicationData, ResetMemberApplicationVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.resetMemberApplication(
  id: id,
  name: name,
  birthDate: birthDate,
  idDoc: idDoc,
  idDocImageUrl: idDocImageUrl,
  signatureUrl: signatureUrl,
  conditionsAcceptedAt: conditionsAcceptedAt,
  requestedAt: requestedAt,
);
ResetMemberApplicationData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String name = ...;
DateTime birthDate = ...;
String idDoc = ...;
String idDocImageUrl = ...;
String signatureUrl = ...;
Timestamp conditionsAcceptedAt = ...;
Timestamp requestedAt = ...;

final ref = SambyConnector.instance.resetMemberApplication(
  id: id,
  name: name,
  birthDate: birthDate,
  idDoc: idDoc,
  idDocImageUrl: idDocImageUrl,
  signatureUrl: signatureUrl,
  conditionsAcceptedAt: conditionsAcceptedAt,
  requestedAt: requestedAt,
).ref();
ref.execute();
```


### UpdateMemberStatus
#### Required Arguments
```dart
String id = ...;
String status = ...;
String resolvedBy = ...;
Timestamp resolvedAt = ...;
SambyConnector.instance.updateMemberStatus(
  id: id,
  status: status,
  resolvedBy: resolvedBy,
  resolvedAt: resolvedAt,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateMemberStatusData, UpdateMemberStatusVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.updateMemberStatus(
  id: id,
  status: status,
  resolvedBy: resolvedBy,
  resolvedAt: resolvedAt,
);
UpdateMemberStatusData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String status = ...;
String resolvedBy = ...;
Timestamp resolvedAt = ...;

final ref = SambyConnector.instance.updateMemberStatus(
  id: id,
  status: status,
  resolvedBy: resolvedBy,
  resolvedAt: resolvedAt,
).ref();
ref.execute();
```


### UpdateMemberRole
#### Required Arguments
```dart
String id = ...;
MemberRole role = ...;
SambyConnector.instance.updateMemberRole(
  id: id,
  role: role,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateMemberRoleData, UpdateMemberRoleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.updateMemberRole(
  id: id,
  role: role,
);
UpdateMemberRoleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
MemberRole role = ...;

final ref = SambyConnector.instance.updateMemberRole(
  id: id,
  role: role,
).ref();
ref.execute();
```


### UpdateMemberBlock
#### Required Arguments
```dart
String id = ...;
bool isBlocked = ...;
SambyConnector.instance.updateMemberBlock(
  id: id,
  isBlocked: isBlocked,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateMemberBlockData, UpdateMemberBlockVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.updateMemberBlock(
  id: id,
  isBlocked: isBlocked,
);
UpdateMemberBlockData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
bool isBlocked = ...;

final ref = SambyConnector.instance.updateMemberBlock(
  id: id,
  isBlocked: isBlocked,
).ref();
ref.execute();
```


### UpdateMemberNotes
#### Required Arguments
```dart
String id = ...;
String internalNotes = ...;
SambyConnector.instance.updateMemberNotes(
  id: id,
  internalNotes: internalNotes,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateMemberNotesData, UpdateMemberNotesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.updateMemberNotes(
  id: id,
  internalNotes: internalNotes,
);
UpdateMemberNotesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String internalNotes = ...;

final ref = SambyConnector.instance.updateMemberNotes(
  id: id,
  internalNotes: internalNotes,
).ref();
ref.execute();
```


### UpdateMemberFcmToken
#### Required Arguments
```dart
String id = ...;
String token = ...;
Timestamp updatedAt = ...;
SambyConnector.instance.updateMemberFcmToken(
  id: id,
  token: token,
  updatedAt: updatedAt,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateMemberFcmTokenData, UpdateMemberFcmTokenVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.updateMemberFcmToken(
  id: id,
  token: token,
  updatedAt: updatedAt,
);
UpdateMemberFcmTokenData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String token = ...;
Timestamp updatedAt = ...;

final ref = SambyConnector.instance.updateMemberFcmToken(
  id: id,
  token: token,
  updatedAt: updatedAt,
).ref();
ref.execute();
```


### CreateEvent
#### Required Arguments
```dart
String bandId = ...;
String title = ...;
String description = ...;
String imageUrl = ...;
bool freeEntry = ...;
String createdBy = ...;
SambyConnector.instance.createEvent(
  bandId: bandId,
  title: title,
  description: description,
  imageUrl: imageUrl,
  freeEntry: freeEntry,
  createdBy: createdBy,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreateEvent, we created `CreateEventBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreateEventVariablesBuilder {
  ...
   CreateEventVariablesBuilder startDate(Timestamp? t) {
   _startDate.value = t;
   return this;
  }
  CreateEventVariablesBuilder endDate(Timestamp? t) {
   _endDate.value = t;
   return this;
  }
  CreateEventVariablesBuilder entryCondition(String? t) {
   _entryCondition.value = t;
   return this;
  }

  ...
}
SambyConnector.instance.createEvent(
  bandId: bandId,
  title: title,
  description: description,
  imageUrl: imageUrl,
  freeEntry: freeEntry,
  createdBy: createdBy,
)
.startDate(startDate)
.endDate(endDate)
.entryCondition(entryCondition)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<CreateEventData, CreateEventVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.createEvent(
  bandId: bandId,
  title: title,
  description: description,
  imageUrl: imageUrl,
  freeEntry: freeEntry,
  createdBy: createdBy,
);
CreateEventData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String bandId = ...;
String title = ...;
String description = ...;
String imageUrl = ...;
bool freeEntry = ...;
String createdBy = ...;

final ref = SambyConnector.instance.createEvent(
  bandId: bandId,
  title: title,
  description: description,
  imageUrl: imageUrl,
  freeEntry: freeEntry,
  createdBy: createdBy,
).ref();
ref.execute();
```


### UpdateEventStatus
#### Required Arguments
```dart
String id = ...;
EventStatus status = ...;
Timestamp updatedAt = ...;
SambyConnector.instance.updateEventStatus(
  id: id,
  status: status,
  updatedAt: updatedAt,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateEventStatusData, UpdateEventStatusVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.updateEventStatus(
  id: id,
  status: status,
  updatedAt: updatedAt,
);
UpdateEventStatusData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
EventStatus status = ...;
Timestamp updatedAt = ...;

final ref = SambyConnector.instance.updateEventStatus(
  id: id,
  status: status,
  updatedAt: updatedAt,
).ref();
ref.execute();
```


### AddEventMember
#### Required Arguments
```dart
String eventId = ...;
String memberId = ...;
SambyConnector.instance.addEventMember(
  eventId: eventId,
  memberId: memberId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<AddEventMemberData, AddEventMemberVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.addEventMember(
  eventId: eventId,
  memberId: memberId,
);
AddEventMemberData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String eventId = ...;
String memberId = ...;

final ref = SambyConnector.instance.addEventMember(
  eventId: eventId,
  memberId: memberId,
).ref();
ref.execute();
```


### RemoveEventMember
#### Required Arguments
```dart
String eventId = ...;
String memberId = ...;
SambyConnector.instance.removeEventMember(
  eventId: eventId,
  memberId: memberId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<RemoveEventMemberData, RemoveEventMemberVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.removeEventMember(
  eventId: eventId,
  memberId: memberId,
);
RemoveEventMemberData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String eventId = ...;
String memberId = ...;

final ref = SambyConnector.instance.removeEventMember(
  eventId: eventId,
  memberId: memberId,
).ref();
ref.execute();
```


### RequestEventAccess
#### Required Arguments
```dart
String eventId = ...;
String memberId = ...;
SambyConnector.instance.requestEventAccess(
  eventId: eventId,
  memberId: memberId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<RequestEventAccessData, RequestEventAccessVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.requestEventAccess(
  eventId: eventId,
  memberId: memberId,
);
RequestEventAccessData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String eventId = ...;
String memberId = ...;

final ref = SambyConnector.instance.requestEventAccess(
  eventId: eventId,
  memberId: memberId,
).ref();
ref.execute();
```


### ResolveEventAccess
#### Required Arguments
```dart
String id = ...;
String status = ...;
String resolvedBy = ...;
Timestamp resolvedAt = ...;
SambyConnector.instance.resolveEventAccess(
  id: id,
  status: status,
  resolvedBy: resolvedBy,
  resolvedAt: resolvedAt,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<ResolveEventAccessData, ResolveEventAccessVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.resolveEventAccess(
  id: id,
  status: status,
  resolvedBy: resolvedBy,
  resolvedAt: resolvedAt,
);
ResolveEventAccessData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String status = ...;
String resolvedBy = ...;
Timestamp resolvedAt = ...;

final ref = SambyConnector.instance.resolveEventAccess(
  id: id,
  status: status,
  resolvedBy: resolvedBy,
  resolvedAt: resolvedAt,
).ref();
ref.execute();
```


### CreateEventAppointment
#### Required Arguments
```dart
String eventId = ...;
String title = ...;
String description = ...;
Timestamp eventDate = ...;
String createdBy = ...;
SambyConnector.instance.createEventAppointment(
  eventId: eventId,
  title: title,
  description: description,
  eventDate: eventDate,
  createdBy: createdBy,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreateEventAppointment, we created `CreateEventAppointmentBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreateEventAppointmentVariablesBuilder {
  ...
   CreateEventAppointmentVariablesBuilder endDate(Timestamp? t) {
   _endDate.value = t;
   return this;
  }

  ...
}
SambyConnector.instance.createEventAppointment(
  eventId: eventId,
  title: title,
  description: description,
  eventDate: eventDate,
  createdBy: createdBy,
)
.endDate(endDate)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<CreateEventAppointmentData, CreateEventAppointmentVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.createEventAppointment(
  eventId: eventId,
  title: title,
  description: description,
  eventDate: eventDate,
  createdBy: createdBy,
);
CreateEventAppointmentData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String eventId = ...;
String title = ...;
String description = ...;
Timestamp eventDate = ...;
String createdBy = ...;

final ref = SambyConnector.instance.createEventAppointment(
  eventId: eventId,
  title: title,
  description: description,
  eventDate: eventDate,
  createdBy: createdBy,
).ref();
ref.execute();
```


### SendBroadcast
#### Required Arguments
```dart
String bandId = ...;
String sentBy = ...;
String title = ...;
String body = ...;
SambyConnector.instance.sendBroadcast(
  bandId: bandId,
  sentBy: sentBy,
  title: title,
  body: body,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<SendBroadcastData, SendBroadcastVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await SambyConnector.instance.sendBroadcast(
  bandId: bandId,
  sentBy: sentBy,
  title: title,
  body: body,
);
SendBroadcastData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String bandId = ...;
String sentBy = ...;
String title = ...;
String body = ...;

final ref = SambyConnector.instance.sendBroadcast(
  bandId: bandId,
  sentBy: sentBy,
  title: title,
  body: body,
).ref();
ref.execute();
```

