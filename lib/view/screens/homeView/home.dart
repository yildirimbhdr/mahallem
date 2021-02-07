import 'package:edufly/core/components/top_notice_widget.dart';
import 'package:edufly/core/models/notice.dart';
import 'package:edufly/core/models/validate.dart';
import 'package:edufly/core/viewModels/notice_model.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/authenticationView/test/data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                color: Color(0xff3A58F5),
                width: double.infinity,
                height: ScreenUtil().setHeight(400),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hoşgeldin,',
                      style: smallTextStyle(
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    sheight5,
                    Text(
                      _userModel.user.quarterName ?? " ",
                      style: smallTextStyle(
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    sheight10,
                    Container(
                      height: ScreenUtil().setHeight(350),
                      child: PageView(
                        children: [
                          TopNoticeWidget(
                            title:
                                "Ahmet bu hafta mahallemizdeki yavru kediyi sahiplendi",
                            imageUrl:
                                "https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png",
                          ),
                          TopNoticeWidget(
                            title:
                                "Pelin bu hafta çevre temizliği için evinin etrafını temizledi",
                            imageUrl:
                                "https://thumbs.dreamstime.com/b/happy-girls-icon-vector-young-woman-icon-illustration-face-people-icon-flat-cartoon-style-person-head-avatar-white-74926734.jpg",
                          ),
                          TopNoticeWidget(
                            title:
                                "Salih bu hafta yapılan görevi birincilikle bitirdi ve ödüllerini aldı",
                            imageUrl:
                                "https://previews.123rf.com/images/jemastock/jemastock1712/jemastock171202411/91074862-man-face-smiling-cartoon-icon-vector-illustration-graphic-design.jpg",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    Consumer<NoticeModel>(
                      builder: (context, noticeModel, child) {
                        return FutureBuilder<Validate>(
                          future:
                              noticeModel.getNotices(_userModel.user.quarterId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                height: ScreenUtil().setHeight(675),
                                child: GridView.builder(
                                  itemCount:
                                      snapshot.data.data["notices"].length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemBuilder: (context, index) {
                                    Notice notice =
                                        snapshot.data.data["notices"][index];
                                    return GridTile(
                                      title: notice.noticeTitle,
                                      img:
                                          "https://thispersondoesnotexist.com/image",
                                      color: Colors.grey.shade200,
                                      press: () {},
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
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
    );
  }
}

class GridTile extends StatelessWidget {
  final String title;
  final Function press;
  final String img;
  final Color color;

  const GridTile({this.title, this.press, this.img, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(20),
      height: ScreenUtil().setHeight(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image.network(img, fit: BoxFit.cover),
          //sheight15,
          Text(
            title,
            style: smallTextStyle(
              color: Colors.black,
              size: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
