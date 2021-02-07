import 'package:edufly/core/components/personel_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaPostWidget extends StatelessWidget {
  final String description;
  final String imageUrl;
  final String userName;
  final String userImageUrl;

  const SocialMediaPostWidget({Key key, this.description, this.imageUrl, this.userName, this.userImageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setWidth(125),
            child: title,
          ),
          Container(
            height: ScreenUtil().setHeight(400),
            color: Colors.white,
            child: postImageAndPostTitle,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            height: ScreenUtil().setHeight(80),
            width: ScreenUtil().setWidth(750),
            child: descriptionWidget,
          ),
          Divider(
            thickness: 1,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget get title => Row(
        children: [
          SizedBox(
            width: ScreenUtil().setWidth(20),
          ),
          PersonelImage(
            imageUrl:userImageUrl,
          ),
          SizedBox(
            width: ScreenUtil().setWidth(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              userName ??"",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ],
          ),
        ],
      );

  Widget get postImageAndPostTitle => Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: ScreenUtil().setHeight(400),
            width: ScreenUtil().setWidth(750),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image:
                      NetworkImage(imageUrl == null || imageUrl.isEmpty ? "https://thispersondoesnotexist.com/image" : imageUrl),
                ),
              ),
            ),
          )
        ],
      );

  Widget get descriptionWidget => Text(
        description ?? "",
        style: TextStyle(fontWeight: FontWeight.w600),
      );
}
