import 'dart:io';

import 'package:edufly/core/components/custom_form.dart';
import 'package:edufly/core/viewModels/post_model.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SocialNetworkPostAddPage extends StatefulWidget {
  @override
  _SocialNetworkPostAddPageState createState() =>
      _SocialNetworkPostAddPageState();
}

class _SocialNetworkPostAddPageState extends State<SocialNetworkPostAddPage> {
    bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    ImagePicker picker = ImagePicker();
    TextEditingController _controllerDescription = TextEditingController();
    File selectedImage;
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                CustomTextFormField(
                  color: Colors.green,
                  hintText: "Açıklama",
                  controller: _controllerDescription,
                ),
                FlatButton(
                  child: Text("Fotoğraf seç"),
                  onPressed: () async {
                    PickedFile image =
                        await picker.getImage(source: ImageSource.gallery);
                    selectedImage = File(image.path);
                  },
                ),
                FlatButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final _postModel =
                          Provider.of<PostModel>(context, listen: false);
                      await _postModel.addPost(_userModel.user,
                          _controllerDescription.text, selectedImage);
                      Navigator.pop(context);
                    },
                    child: Text("Kaydet"))
              ],
            ),
    );
  }
}
