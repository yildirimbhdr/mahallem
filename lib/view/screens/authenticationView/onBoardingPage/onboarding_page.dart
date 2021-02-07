import 'dart:io';

import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/authenticationView/loginPage/login_page.dart';
import 'package:edufly/view/screens/authenticationView/registerPage/register_page.dart';
import 'package:edufly/view/screens/authenticationView/test/data.dart';
import 'package:edufly/view/screens/authenticationView/test/widgetCenter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                _buildPageContent(
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
                ),
                _buildLoginPage()
              ],
            ),
            Positioned(
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
            )
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
          Image.asset("assets/img/edulfy.png", fit: BoxFit.cover),
          sheight40,
          ButtonCenter(
            iconData: Icons.email,
            title: "Continue With Email",
            color: Color(0xff29303F),
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          sheight10,
          Text("Sign up with social media",
              style: descpTextStyle(color: Color(0xff1D2952))),
          sheight20,
          ButtonCenter(
            iconData: FontAwesomeIcons.facebook,
            title: "Continue With Facebook",
            color: Color(0xff4267B2),
            press: () {},
          ),
          sheight20,
          ButtonCenter(
            iconData: FontAwesomeIcons.google,
            title: "Continue With Google",
            color: Color(0xff679EF5),
            press: () {
              signInWithGoogle();
            },
          ),
          sheight40,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SingUpPage()));
              },
            )
          ])
        ],
      ),
    ));
  }

  signInWithGoogle(){
    print("fsadf");
    final _userModel = Provider.of<UserModel>(context , listen:false);
    _userModel.signInWithGoogle();
  }
}
