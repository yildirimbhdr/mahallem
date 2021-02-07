import 'package:edufly/core/base/authentication_base.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthenticationService extends AuthenticationBase {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  MyUser resultUser = MyUser(
      userEmail: "fakeemail@hotmail.com",
      userId: "000",
      userName: "fakeName");

  @override
  Future<Validate> currentUser() async {
    User user = firebaseAuth.currentUser;
    MyUser myUser = MyUser(userEmail: user.email, userId: user.uid);
    Validate validate = Validate();
    validate.data = myUser.toJson();
    validate.success = true;
    validate.message = "Başarılı";

    return validate;
  }

  @override
  Future<Validate> register(
    String email,
    String password,
    String userName,
  ) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    MyUser user = MyUser(
        userEmail: email,
        userId: userCredential.user.uid,
        userName: userName);
    return Validate(data: user.toJson(), message: "Başarılı", success: true);
  }

  signIn(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    MyUser user = MyUser(
        userEmail: email, userId: userCredential.user.uid);
    return Validate(data: user.toJson(), message: "Başarılı", success: true);
  }

  signInWithGoogle() async {
    UserCredential userCredential;

    final GoogleSignInAccount googleUser =
        await GoogleSignIn().signIn().catchError((ex) {
      print(ex.toString());
    });

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential googleAuthCredential =
        GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    userCredential =
        await firebaseAuth.signInWithCredential(googleAuthCredential);
    MyUser user = MyUser(
      userEmail: userCredential.user.email,
      userId: userCredential.user.uid,
    );
    return Validate(data: user.toJson(), message: "Başarılı", success: true);
  }

  signOut() async {
    try {
      await firebaseAuth.signOut();
      return Validate(success: true, message: "Başarılı", data: {});
    } catch (ex) {
      return Validate(
          data: {}, success: false, message: "Hata : " + ex.toString());
    }
  }
}
