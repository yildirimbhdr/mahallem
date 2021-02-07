import 'package:edufly/core/init/locator/locator.dart';
import 'package:edufly/core/repositories/user_repository.dart';
import 'package:edufly/core/services/fakeServices/fake_authentication_service.dart';
import 'package:edufly/core/services/firebaseServices/firebase_authentication_services.dart';
import 'package:edufly/core/services/firebaseServices/firebase_cloud_firestore_services.dart';
import 'package:edufly/core/services/firebaseServices/firebase_storage_services.dart';

abstract class RepositoryBase {
  ServiceState service_state = ServiceState.Real;

  FakeAuthenticationService fakeAuthenticationService =
      locator<FakeAuthenticationService>();
  FirebaseAuthenticationService firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
        FirebaseCloudFireStoreServices firebaseCloudFireStoreServices =
      locator<FirebaseCloudFireStoreServices>();
              FirebaseStorageServices firebaseStorageServices =
      locator<FirebaseStorageServices>();
}
