# Basic Usage

```dart
SambyConnector.instance.CreateBand(createBandVariables).execute();
SambyConnector.instance.UpdateBandImages(updateBandImagesVariables).execute();
SambyConnector.instance.UpdateBand(updateBandVariables).execute();
SambyConnector.instance.AddBandCondition(addBandConditionVariables).execute();
SambyConnector.instance.DeleteBandCondition(deleteBandConditionVariables).execute();
SambyConnector.instance.CreateFounderMember(createFounderMemberVariables).execute();
SambyConnector.instance.UpdateMemberApplication(updateMemberApplicationVariables).execute();
SambyConnector.instance.ResetMemberApplication(resetMemberApplicationVariables).execute();
SambyConnector.instance.UpdateMemberStatus(updateMemberStatusVariables).execute();
SambyConnector.instance.UpdateMemberRole(updateMemberRoleVariables).execute();

```

## Optional Fields

Some operations may have optional fields. In these cases, the Flutter SDK exposes a builder method, and will have to be set separately.

Optional fields can be discovered based on classes that have `Optional` object types.

This is an example of a mutation with an optional field:

```dart
await SambyConnector.instance.CreateEventAppointment({ ... })
.endDate(...)
.execute();
```

Note: the above example is a mutation, but the same logic applies to query operations as well. Additionally, `createMovie` is an example, and may not be available to the user.

