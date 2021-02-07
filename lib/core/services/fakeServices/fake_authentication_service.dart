import 'package:edufly/core/base/authentication_base.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';

class FakeAuthenticationService extends AuthenticationBase {

  MyUser resultUser = MyUser(

      userId: "000",
      userName: "fakeName");
  @override
  Future<Validate> currentUser() async {
    Validate validate = Validate();
    validate.data = resultUser.toJson();
    validate.success = true;
    validate.message = "Başarılı";
    await Future.delayed(Duration(seconds: 1));

    return validate;
  }

  @override
  Future<Validate> register(
      String email, String userName, String password) async {
    Validate validate = Validate();
    validate.data = resultUser.toJson();
    validate.success = false;
    validate.message = "Böyle bir email bulunamadı";
    await Future.delayed(Duration(seconds: 1));
    return validate;
  }

  signIn(String email, String password) {
    Validate validate = Validate();
    validate.data = resultUser.toJson();
    validate.success = false;
    validate.message = "Email hatalı";
    return validate;
  }
}
