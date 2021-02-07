import 'package:edufly/core/init/locator/locator.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';
import 'package:edufly/core/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  MyUser _user;
  UserRepository _userRepository = locator<UserRepository>();

  MyUser get user => _user;

  UserModel() {
    currentUser();
  }

  set user(MyUser value) {
    _user = value;
    notifyListeners();
  }

  currentUser() async {
    try {
      Validate _validate = await _userRepository.currentUser();
      if (_validate.success) user = MyUser.fromJson(_validate.data);
      print(user.toJson());
      return _validate;
    } catch (ex) {
      return Validate(success: false, message: ex.toString(), data: {});
    }
  }

  signIn(String identificationId, String quarterId) async {
    try {
      Validate _validate =
          await _userRepository.signIn(identificationId, quarterId);
      print("validate " + _validate.toJson().toString());

      if (_validate.success) {
        user = MyUser.fromJson(_validate.data);
      }
      return _validate;
    } catch (ex) {
      print(ex.toString());
      return Validate(success: false, message: ex.toString(), data: {});
    }
  }

  register(String email, String password, String userName) async {
    try {
      String errMessage;
      if (email.length < 6) {
        errMessage = "Email 6 harften küçük olamaz!";
      } else if (password.length < 6) {
        errMessage = "Şifre 6 harften küçük olamaz!";
      }
      if (errMessage != null)
        return Validate(success: false, message: errMessage, data: {});
      else {
        Validate _validate =
            await _userRepository.register(email, password, userName);
        if (_validate.success) user = MyUser.fromJson(_validate.data);

        return _validate;
      }
    } catch (hata) {
      return Validate(success: false, message: hata.toString(), data: {});
    }
  }

  signInWithGoogle() async {
    try {
      String errMessage;

      if (errMessage != null)
        return Validate(success: false, message: errMessage, data: {});
      else {
        Validate _validate = await _userRepository.signInWithGoogle();
        print(_validate.toJson());
        if (_validate.success) user = MyUser.fromJson(_validate.data);
        return _validate;
      }
    } catch (ex) {
      print(ex.toString());
      return Validate(success: false, message: ex.toString(), data: {});
    }
  }

  signOut() async {
    Validate validate = await _userRepository.signOut();
    user = null;
  }
}
