import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/authenticationView/test/data.dart';
import 'package:edufly/view/screens/authenticationView/test/widgetCenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 280,
                  ),
                  sheight20,
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.exit_to_app),
                              onPressed: () async {
                                final _userModel = Provider.of<UserModel>(
                                    context,
                                    listen: false);
                                await _userModel.signOut();
                              })
                        ],
                      ),
                      sheight50,
                      Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: Image.network(_userModel.user.imageUrl ?? ""),
                      ),
                      sheight20,
                      Text(
                        _userModel.user.userName.toUpperCase(),
                        style: smallTextStyle(color: Colors.white, size: 20),
                      )
                    ],
                  ),
                ],
              ),
              sheight10,
              _buildPersonInpormatin(
                  title: "Mahalle kodu",
                  detais: _userModel.user.quarterId ?? ""),
              sheight20,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text("DetaylI bilgi".toUpperCase(),
                    textAlign: TextAlign.left,
                    style: smallTextStyle(
                      color: Color(0xff4749A0),
                      size: 20,
                    )),
              ),
              sheight20,
              _buildPersonInpormatin(
                  title: "İsim", detais: _userModel.user.userName ?? ""),
              sheight10,
              Divider(
                color: Colors.black,
                height: 5,
              ),
              sheight15,
              _buildPersonInpormatin(
                  title: "Tc Kimlik",
                  detais: _userModel.user.identificationNumber ?? ""),
              sheight10,
              Divider(
                color: Colors.black,
                height: 5,
              ),
              sheight15,
              _buildPersonInpormatin(title: "Telefon", detais: "507 180 2913"),
              sheight10,
              Divider(
                color: Colors.black,
                height: 5,
              ),
              sheight15,
              _buildPersonInpormatin(
                  title: "Ev Adresi",
                  detais: _userModel.user.quarterName ?? ""),
              sheight10,
              Divider(
                color: Colors.black,
                height: 5,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildPersonInpormatin({String title, String detais, Function press}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: smallTextStyle(
              color: Color(0xff878787),
              size: 18,
            ),
          ),
          Text(
            detais,
            style: smallTextStyle(
              color: Color(0xff878787),
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
