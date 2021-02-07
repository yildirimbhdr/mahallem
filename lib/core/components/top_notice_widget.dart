import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNoticeWidget extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String title;

  const TopNoticeWidget({Key key, this.imageUrl, this.description, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(350),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFCEDBEF).withOpacity(0.45),
            offset: Offset(0, 3.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(300),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage(imageUrl ?? "https://thispersondoesnotexist.com/image"),
                ),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(350),
              height: ScreenUtil().setHeight(300),
              child: Column(
                children: [
                  Container(
                    height: ScreenUtil().setHeight(300),
                    child: Text(
                      title ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(37),
                          fontWeight: FontWeight.w600),
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
}
