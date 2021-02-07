import 'package:edufly/core/base/repository_base.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';
import 'package:edufly/core/services/sqfliteServices/sql_flite_services.dart';

enum ServiceState { Fake, Real }

class UserRepository extends RepositoryBase {
  Future<Validate> currentUser() async {
    Validate _validate;
    DatabaseHelper databaseHelper = DatabaseHelper();
    if (service_state == ServiceState.Fake) {
      _validate = await fakeAuthenticationService.currentUser();
    } else {
     _validate = await databaseHelper.currentUser();
    }
    return _validate;
  }

  Future<Validate> signIn(String identificationId, String quarterId) async {
    Validate _validate;

    _validate = await firebaseCloudFireStoreServices.signIn(
        identificationId, quarterId);

    if (_validate.success) {
      DatabaseHelper db = DatabaseHelper();
      await db.saveUser(MyUser.fromJson(_validate.data));
    }
    return _validate;
  }

  Future<Validate> signInWithGoogle() async {
    Validate _validate;
    if (service_state == ServiceState.Fake) {
    } else {
      _validate = await firebaseAuthenticationService.signInWithGoogle();
      if (_validate.success) {
        firebaseCloudFireStoreServices.saveUser(
          MyUser.fromJson(_validate.data),
        );
      }
    }
    return _validate;
  }

  Future<Validate> register(String email, String pass, String userName) async {
    Validate _validate;

    if (service_state == ServiceState.Fake) {
      _validate =
          await fakeAuthenticationService.register(email, pass, userName);
    } else {
      _validate =
          await firebaseAuthenticationService.register(email, pass, userName);
      if (_validate.success) {
        firebaseCloudFireStoreServices.saveUser(
          MyUser.fromJson(_validate.data),
        );
      }
    }
    return _validate;
  }

  signOut() async {
    Validate _validate;

    if (service_state == ServiceState.Fake) {
    } else {
      _validate = await firebaseAuthenticationService.signOut();
      if (_validate.success) {}
    }
    return _validate;
  }
}
