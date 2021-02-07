import 'package:edufly/core/viewModels/notice_model.dart';
import 'package:edufly/core/viewModels/post_model.dart';
import 'package:edufly/view/screens/homeView/home.dart';
import 'package:edufly/view/screens/homeView/notificationPage/notification_page.dart';
import 'package:edufly/view/screens/homeView/profilPage/profil_page.dart';
import 'package:edufly/view/screens/homeView/quarterPage/quarter_landing_page.dart';
import 'package:edufly/view/screens/homeView/socialNetworkPage/social_network_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomNavigatorPage extends StatefulWidget {
  @override
  _BottomNavigatorPageState createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int currentIndex = 1;
  PageController _pageController = PageController();
  List<Widget> pages = [
    ChangeNotifierProvider(
        create: (context) => NoticeModel(), child: HomeView()),
    ChangeNotifierProvider(create: (context)=> NoticeModel(),child: QuarterLandingPage()),
    ChangeNotifierProvider(
        create: (context) => PostModel(), child: SocialNetworkPage()),
    NotificationPage(),
    ProfilPage(),
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);

    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return pages[currentIndex];
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.new_releases_rounded,
                size: 28,
              ),
              label: "Duyurular",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_city_rounded,
                size: 28,
              ),
              label: "Mahallem",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.network_wifi,
                size: 28,
              ),
              label: "Sosyal ağ",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 28,
              ),
              label: "Bildirimler",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: "Profil",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedLabelStyle: buttonNavigatorTextStyle(
            color: const Color(0xff143ED2),
            size: 17,
          ),
          selectedItemColor: Color(0xff143ED2),
          unselectedItemColor: Color(0xff000000),
          unselectedLabelStyle: buttonNavigatorTextStyle(
            color: const Color(0xFF9195B2),
            size: 14,
          ),
          elevation: 0,
        ),
      ),
    );
  }

  TextStyle buttonNavigatorTextStyle({Color color, double size}) {
    return TextStyle(
      fontFamily: 'Nexa',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }
}
//
