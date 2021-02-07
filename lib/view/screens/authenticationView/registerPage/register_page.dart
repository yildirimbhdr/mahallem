import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/authenticationView/loginPage/login_page.dart';
import 'package:edufly/view/screens/authenticationView/test/data.dart';
import 'package:edufly/view/screens/authenticationView/test/widgetCenter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SingUpPage extends StatefulWidget {
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  String userName, email, password;

  final key = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isValue = false;
  bool isLaoding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
          child: Form(
            key: key,
            child: isLaoding
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset("assets/img/close.png"),
                          ),
                        ),
                        sheight15,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Sing Up",
                              style: titleTextStyle(color: Colors.black),
                            ),
                            sheight30,
                            TextFormCenter(
                              title: "Username",
                              auto: false,
                              iconData: Icons.person,
                              type: TextInputType.name,
                              obs: false,
                              onSaved: (value) {
                                userName = value;
                              },
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "You are use add name label";
                                } else if (value.trim().length < 4) {
                                  return "You are wrong name";
                                }
                                return null;
                              },
                            ),
                            sheight30,
                            TextFormCenter(
                              title: "Email Adress",
                              auto: false,
                              iconData: Icons.mail,
                              type: TextInputType.emailAddress,
                              obs: false,
                              onSaved: (value) {
                                email = value;
                              },
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "You are  add email label";
                                } else if (!value.contains("@")) {
                                  return "You are email not true";
                                }
                                return null;
                              },
                            ),
                            sheight30,
                            TextFormCenter(
                              title: "Password",
                              auto: true,
                              type: TextInputType.visiblePassword,
                              iconData: FontAwesomeIcons.lock,
                              obs: true,
                              onSaved: (value) {
                                password = value;
                              },
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "You are  add password label";
                                } else if (value.trim().length < 6) {
                                  return "You are Wrong password";
                                }
                                return null;
                              },
                            ),
                            sheight30,
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        isValue = value;
                                      });
                                    },
                                    value: isValue,
                                  ),
                                  swidth5,
                                  Expanded(
                                    child: Text(
                                      "Please sign me up to the latest book news and exclusive offers",
                                      style: descpTextStyle(
                                        color: Color(0xff7483A0),
                                      ),
                                    ),
                                  )
                                ]),
                            sheight20,
                            ButtonCenter(
                              isShow: true,
                              title: "Register",
                              press: register,
                              color: Color(0xff3A58F5),
                            ),
                            sheight20,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "You have an account? ",
                                    style: descpTextStyle(
                                      color: Color(0xff7483A0),
                                    ),
                                  ),
                                  swidth5,
                                  TextCenter(
                                    title: "Sign In",
                                    color: Color(0xff33A6FF),
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                  )
                                ])
                          ],
                        )
                      ],
                    ),
                  ),
          ),
        ),
      )),
    );
  }

  Future<void> register() async {
    if (isValue != true) {
      var snackbar = SnackBar(content: Text("Lütfen Sözleşmeyi Onaylayınız"));
      scaffoldkey.currentState.showSnackBar(snackbar);
    } else {
      if (key.currentState.validate()) {
        key.currentState.save();
        setState(() {
          isLaoding = true;
        });
        try {
          final _userModel = Provider.of<UserModel>(context, listen: false);
          await _userModel.register(email, password, userName);
          setState(() {
            isLaoding = false;
          });
          Navigator.pop(context);
          Navigator.pop(context);
        } catch (e) {
          setState(() {
            isLaoding = false;
          });
          var snackbar = SnackBar(content: Text("Bir hata ile Karşılaştık"));
          scaffoldkey.currentState.showSnackBar(snackbar);
        }
      }
    }
  }
}
