import 'dart:io';

import 'package:edufly/core/components/custom_form.dart';
import 'package:edufly/core/viewModels/notice_model.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddNoticePage extends StatefulWidget {
  @override
  _AddNoticePageState createState() => _AddNoticePageState();
}

class _AddNoticePageState extends State<AddNoticePage> {
  File selectedImage;
  ImagePicker picker = ImagePicker();
  bool isLoading = false;
  TextEditingController _controllerTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                CustomTextFormField(
                  hintText: "Duyuru başlığı",
                  color: Colors.blue,
                  controller: _controllerTitle,
                  maxLines: 3,
                ),
                FlatButton(
                  child: Text("Fotoğraf seç"),
                  onPressed: () async {
                    PickedFile image =
                        await picker.getImage(source: ImageSource.gallery);
                    setState(() {
                      selectedImage = File(image.path);
                    });
                  },
                ),
                selectedImage != null
                    ? Container(
                        width: 200,
                        height: 200,
                        child: Image.file(selectedImage),
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        color: Colors.green,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final _noticeModel =
                              Provider.of<NoticeModel>(context, listen: false);
                          await _noticeModel.addNotice(
                              _controllerTitle.text, "", _userModel.user);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Duyuruyu paylaş",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
    );
  }
}
