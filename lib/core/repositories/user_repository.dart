import 'package:edufly/core/models/user.dart';
import 'package:flutter/foundation.dart';

class UserRepository with ChangeNotifier {
  User _user;

  User get user => _user;

  set(User value) {
    _user = value;
    notifyListeners();
  }
}
