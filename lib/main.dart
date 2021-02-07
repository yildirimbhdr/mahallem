import 'package:edufly/core/init/locator/locator.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/authenticationView/loginPage/login_page.dart';
import 'package:edufly/view/screens/authenticationView/onBoardingPage/onboarding_page.dart';
import 'package:edufly/view/screens/landingView/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: FutureBuilder<Object>(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return LandingPage();
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
