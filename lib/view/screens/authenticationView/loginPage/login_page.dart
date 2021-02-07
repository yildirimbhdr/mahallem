import 'package:edufly/core/models/validate.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/authenticationView/registerPage/register_page.dart';
import 'package:edufly/view/screens/authenticationView/test/data.dart';
import 'package:edufly/view/screens/authenticationView/test/widgetCenter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  final key = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isValue = false;
  bool isLoading = false;
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
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
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
                            "Sing In",
                            style: titleTextStyle(color: Colors.black),
                          ),
                          sheight30,
                          TextFormCenter(
                            title: "Tc kimlik",
                            auto: false,
                            iconData: Icons.mail,
                            type: TextInputType.emailAddress,
                            obs: false,
                            onSaved: (value) {
                              email = value;
                            },
                            validate: (value) {
                              /*   if (value.isEmpty) {
                                return "You are  add email label";
                              } else if (!value.contains("@")) {
                                return "You are email not true";
                              }*/
                              return null;
                            },
                          ),
                          sheight30,
                          TextFormCenter(
                            title: "Mahalle id",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Switch(
                                      onChanged: (bool value) {
                                        setState(() {
                                          isValue = value;
                                        });
                                      },
                                      value: isValue,
                                    ),
                                    swidth5,
                                    Text(
                                      'Remind me',
                                      textAlign: TextAlign.start,
                                      style: descpTextStyle(
                                        color: Colors.black,
                                      ),
                                    )
                                  ]),
                              TextCenter(
                                title: "Forget Password?",
                                color: Color(0xff33A6FF),
                                press: () {},
                              ),
                            ],
                          ),
                          sheight20,
                          ButtonCenter(
                            isShow: true,
                            title: "Login",
                            press: login,
                            color: Color(0xff3A58F5),
                          ),
                          sheight20,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: descpTextStyle(
                                    color: Color(0xff7483A0),
                                  ),
                                ),
                                swidth5,
                                TextCenter(
                                  title: "Sign up",
                                  color: Color(0xff33A6FF),
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SingUpPage(),
                                      ),
                                    );
                                  },
                                )
                              ])
                        ],
                      )
                    ],
                  ),
          ),
        ),
      )),
    );
  }

  Future<void> login() async {
    if (isValue != true) {
      var snackbar = SnackBar(
        content: Text("Uygulamayı Tekrar başlattığınızda hatırlanmauacaksınız"),
      );
      //    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    if (key.currentState.validate()) {
      key.currentState.save();
      setState(() {
        isLoading = true;
      });
      try {
        final _userModel = Provider.of<UserModel>(context, listen: false);
        Validate validate = await _userModel.signIn(password, email);
        setState(() {
          isLoading = false;
        });
        if (!validate.success) {
          var snackbar = SnackBar(content: Text(validate.message));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }else{
          Navigator.pop(context);
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        var snackbar =
            SnackBar(content: Text("Bir hata ile Karşılaştık" + e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }
  }
}
