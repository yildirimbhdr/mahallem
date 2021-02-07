import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonelImage extends StatelessWidget {
  final String imageUrl;
  final double width;

  const PersonelImage({Key key, this.imageUrl, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      if (imageUrl.isNotEmpty) {
        return Row(
          children: [
            ClipOval(

              child: Image.network(
                imageUrl,
                width: width == null ? ScreenUtil().setWidth(100) : width,
                height: width == null ? ScreenUtil().setWidth(100) : width,
                fit: BoxFit.cover,
              ),
            )
          ],
        );
      } else
        return Icon(Icons.person);
    } else
      return Icon(Icons.person);
  }
}
