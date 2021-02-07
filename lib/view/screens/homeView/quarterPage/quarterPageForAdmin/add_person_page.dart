import 'dart:io';

import 'package:edufly/core/components/custom_form.dart';
import 'package:edufly/core/viewModels/quarter_model.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPersonPage extends StatefulWidget {
  @override
  _AddPersonPageState createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  File selectedImage;
  ImagePicker picker = ImagePicker();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhoneNumber = TextEditingController();
  TextEditingController _controllerTc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    return Scaffold(
      body: ListView(
        children: [
          CustomTextFormField(
            hintText: "Kişi ismi",
            color: Colors.blue,
            controller: _controllerName,
          ),
          CustomTextFormField(
            hintText: "Kişi email",
            color: Colors.blue,
            controller: _controllerEmail,
          ),
          CustomTextFormField(
            hintText: "Telefon numarası",
            color: Colors.blue,
            controller: _controllerPhoneNumber,
          ),
          CustomTextFormField(
            hintText: "Tc kimlik numarası",
            color: Colors.blue,
            controller: _controllerTc,
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
                    final _quarterModel =
                        Provider.of<QuarterModel>(context, listen: false);
                    await _quarterModel.addPerson(
                        _controllerName.text,
                        _controllerEmail.text,
                        _controllerTc.text,
                        _controllerPhoneNumber.text,
                        selectedImage,
                        _userModel.user);
                  },
                  child: Text("Kişiyi ekle" , style: TextStyle(color: Colors.white),)),
            ],
          )
        ],
      ),
    );
  }
}
