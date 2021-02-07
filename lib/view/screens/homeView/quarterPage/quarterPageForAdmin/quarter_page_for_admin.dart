import 'package:edufly/core/viewModels/notice_model.dart';
import 'package:edufly/core/viewModels/quarter_model.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/authenticationView/test/data.dart';
import 'package:edufly/view/screens/homeView/quarterPage/quarterPageForAdmin/add_notice_page.dart';
import 'package:edufly/view/screens/homeView/quarterPage/quarterPageForAdmin/add_person_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class QuarterPageForAdmin extends StatefulWidget {
  @override
  _QuarterPageForAdminState createState() => _QuarterPageForAdminState();
}

class _QuarterPageForAdminState extends State<QuarterPageForAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            child: Text("Kişi ekle"),
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangeNotifierProvider(
                                    create: (context) => QuarterModel(),
                                    child: AddPersonPage(),
                                  ),
                                ),
                              );
                            },
                          ),
                          FlatButton(
                            child: Text("Duyuru ekle"),
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangeNotifierProvider(
                                    create: (context) => NoticeModel(),
                                    child: AddNoticePage(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      sheight15,
                      Text(
                        "Sıralama",
                        style: TextStyle(
                          fontFamily: 'CircularStd-Bold',
                          fontSize: 36.0,
                          color: Colors.black,
                          height: 1.22,
                        ),
                      ),
                      sheight15,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return BuildList(
                            userName: "dsadsdasd",
                            img:
                                "https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// onTap: press,
  Widget _buildMuhtarlikContent({String title, String descp, Function press}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      height: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFE4E1F7),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Muhtarlık İsmi",
                style: smallTextStyle(
                  color: Color(0xff0E2ED3),
                  size: 20,
                ),
              ),
              Text(
                "Kamela Muhtarlığı",
                style: smallTextStyle(
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ],
          ),
          sheight10,
          Divider(
            color: Colors.black,
            height: 5,
          ),
          sheight15,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Muhtarlık İletişimi",
                style: smallTextStyle(
                  color: Color(0xff0E2ED3),
                  size: 20,
                ),
              ),
              Text(
                "05422123955",
                style: smallTextStyle(
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ],
          ),
          sheight15,
          Divider(
            color: Colors.black,
            height: 5,
          ),
          sheight15,
          InkWell(
            onTap: () {},
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                alignment: Alignment.center,
                width: 180.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: const Color(0xFFC4A12D).withOpacity(0.1),
                ),
                child: Text(
                  'Detaylı Bilgi İçin Tıkla',
                  style: TextStyle(
                    fontFamily: 'Circular',
                    fontSize: 15.0,
                    color: Color(0xff0E2ED3),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuildList extends StatelessWidget {
  final String img;
  final String userName;
  final int puan;

  const BuildList({this.img, this.userName, this.puan});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.blue,
                ),
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
              swidth30,
              Text(
                userName,
                textAlign: TextAlign.center,
                style: smallTextStyle(
                  color: Colors.black,
                  size: 20,
                ),
              )
            ],
          ),
          Text(
            puan.toString(),
            textAlign: TextAlign.center,
            style: smallTextStyle(
              color: Colors.black,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            child: Text("Kişi ekle"),
            color: Colors.blue,
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                          create: (context) => QuarterModel(),
                          child: AddPersonPage(),),));
            },
          ),
          FlatButton(
            child: Text("Duyuru ekle"),
            color: Colors.blue,
            onPressed: () async {
            
            },
          )
        ],
      ),
    );
  } */
