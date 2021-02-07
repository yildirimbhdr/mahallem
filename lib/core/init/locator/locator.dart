import 'package:edufly/core/repositories/notice_repository.dart';
import 'package:edufly/core/repositories/post_repository.dart';
import 'package:edufly/core/repositories/quarter_repository.dart';
import 'package:edufly/core/repositories/user_repository.dart';
import 'package:edufly/core/services/fakeServices/fake_authentication_service.dart';
import 'package:edufly/core/services/firebaseServices/firebase_authentication_services.dart';
import 'package:edufly/core/services/firebaseServices/firebase_cloud_firestore_services.dart';
import 'package:edufly/core/services/firebaseServices/firebase_storage_services.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserModel());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => FirebaseAuthenticationService());
  locator.registerLazySingleton(() => FakeAuthenticationService());
  locator.registerLazySingleton(() => FirebaseCloudFireStoreServices());
  locator.registerLazySingleton(() => FirebaseStorageServices());
  locator.registerLazySingleton(() => NoticeRepository());
  locator.registerLazySingleton(() => PostRepository());
  locator.registerLazySingleton(() => QuarterRepository());
  //ocator.registerLazySingleton(() => DatabaseHelper());
}
