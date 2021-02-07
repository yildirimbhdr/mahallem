
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationBase {
  currentUser();
  register(String email , String userName , String password);
}
