import 'dart:io';
import 'package:edufly/core/models/validate.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/authenticationView/test/data.dart';
import 'package:edufly/view/screens/authenticationView/test/widgetCenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String identityCode;
  String quarterCode;
  bool isValue = false;
  final key = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isLaoding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
               /* _buildPageContent(
                  img: "assets/img/splash.png",
                  title: "Welcome to edufly school ebooks store",
                  descp: "Explore educaiotn ebooksat edufly app ",
                ),
                _buildPageContent(
                  img: "assets/img/splash2.png",
                  title: "Find out about your children's ebook in a click",
                  descp: "Choosing the right booksat one place",
                ),
                _buildPageContent(
                  img: "assets/img/splash3.png",
                  title: "The edufly eBooks Store offers you millions ",
                  descp:
                      "Millions of titles across categories like Children's book",
                ),*/
                _buildLoginPage()
              ],
            ),
           /* Positioned(
              bottom: 40,
              left: MediaQuery.of(context).size.width * .05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Row(
                      children: [
                        Container(
                          child: Row(children: [
                            for (int i = 0; i < _totalPages; i++)
                              i == _currentPage
                                  ? _buildPageIndicator(true)
                                  : _buildPageIndicator(false)
                          ]),
                        ),
                        Spacer(),
                        if (_currentPage < 3)
                          InkWell(
                            onTap: () {
                              _pageController.animateToPage(3,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.linear);
                              setState(() {});
                            },
                            child: Container(
                              height: Platform.isIOS ? 70 : 60,
                              alignment: Alignment.center,
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  fontFamily: 'Nexa',
                                  fontSize: 18.0,
                                  color: Color(0xff3A58F5),
                                  letterSpacing: 0.54,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent({String img, String title, String descp}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Center(
                child: Image.asset(img),
              ),
              SizedBox(height: 50),
              Text(
                title,
                textAlign: TextAlign.center,
                style: titleTextStyle(color: Color(0xFF1136D2)),
              ),
              sheight20,
              Text(
                descp,
                textAlign: TextAlign.center,
                style: descpTextStyle(color: Color(0xFF797979)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 9.0 : 8.0,
      width: isCurrentPage ? 37.0 : 35,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xff3A58F5) : Colors.white54,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFB0B0B0),
        ),
      ),
    );
  }

  Widget _buildLoginPage() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
     
          sheight20,
          Container(
              width: double.infinity,
              height: 500,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
                child: Form(
                  key: key,
                  child: isLaoding
                      ? Center(child: CircularProgressIndicator())
                      : Column(children: [
                       
                          sheight15,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Giriş",
                                style: titleTextStyle(color: Colors.black),
                              ),
                              sheight30,
                              sheight15,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormCenter(
                                    title: "Tc Kimliğinizi Girin",
                                    auto: false,
                                    iconData: Icons.person,
                                    type: TextInputType.number,
                                    obs: false,
                                    onSaved: (value) {
                                      identityCode = value;
                                    },
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "You are use add tc label";
                                      } else if (value.trim().length != 11) {
                                        return "Lütfen tc kimliğinizi kontrol";
                                      }
                                      return null;
                                    },
                                  ),
                                  sheight30,
                                  TextFormCenter(
                                    title: "Mahalle Id",
                                    auto: false,
                                    iconData: Icons.ac_unit,
                                    type: TextInputType.text,
                                    obs: false,
                                    onSaved: (value) {
                                      quarterCode = value;
                                    },
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "Lütfen mahalla Id'nizi girin";
                                      }
                                      return null;
                                    },
                                  ),
                                  sheight20,
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            "Kullanıcı kayit KVK, okudum,onaylıyorum.",
                                            style: descpTextStyle(
                                              color: Color(0xff7483A0),
                                            ),
                                          ),
                                        )
                                      ]),
                                  sheight20,
                                  ButtonCenter(
                                    isShow: true,
                                    title: "Giriş Yap",
                                    press: singUp,
                                    color: Color(0xff3A58F5),
                                  ),
                                  sheight20,
                                ],
                              )
                            ],
                          ),
                        ]),
                ),
              )),
        ],
      ),
    ));
  }

  Future<void> singUp() async {
    if (isValue != true) {
      var snackbar = SnackBar(content: Text("Lütfen Sözleşmeyi Onaylayınız"));
      scaffoldkey.currentState.showSnackBar(snackbar);
    } else {
      if (key.currentState.validate()) {
        key.currentState.save();
        // setState(() {
        //   isLaoding = true;
        // });
        try {
          final _userModel = Provider.of<UserModel>(context, listen: false);
          Validate validate =
              await _userModel.signIn(identityCode, quarterCode);
          if (!validate.success) {
            var snackbar = SnackBar(content: Text(validate.message));
            scaffoldkey.currentState.showSnackBar(snackbar);
          }
        } catch (e) {
          setState(() {
            isLaoding = false;
          });
        }
      }
    }
  }
}
