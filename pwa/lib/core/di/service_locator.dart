import 'package:samby/data/datasources/dataconnect_datasource.dart';
import 'package:samby/data/repositories/association_repository_impl.dart';
import 'package:samby/data/repositories/membership_repository_impl.dart';
import 'package:samby/domain/repositories/association_repository.dart';
import 'package:samby/domain/repositories/membership_repository.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  final FirebaseDataConnect firebaseDataConnect = FirebaseDataConnect.instanceFor(
    connectorConfig: ConnectorConfig('europe-west1', 'samby', 'samby-service'),
  );

  final DataconnectDatasource datasource = DataconnectDatasource(dc: firebaseDataConnect);

  sl.registerSingleton<AssociationRepository>(AssociationRepositoryImpl(datasource));
  sl.registerSingleton<MembershipRepository>(MembershipRepositoryImpl(datasource));
}
