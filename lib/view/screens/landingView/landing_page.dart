import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/authenticationView/onBoardingPage/onBoarding.dart';
import 'package:edufly/view/screens/homeView/bottomNavigatorPage/button_navigator_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, userModel, child) {
        if (userModel.user == null)
          return OnboardingPage();
        else
          return BottomNavigatorPage();
      },
    );
  }
}
