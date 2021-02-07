import 'package:flutter/material.dart';
import './data.dart';

class ButtonCenter extends StatelessWidget {
  final Function press;
  final String title;
  final IconData iconData;
  final Color color;
  final bool isShow;
  const ButtonCenter(
      {this.press, this.title, this.iconData, this.color, this.isShow});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isShow == false || isShow == null
                  ? Icon(
                      iconData,
                      color: Colors.white,
                    )
                  : Container(),
              swidth10,
              Text(title, style: buttonTextStyle()),
            ],
          )),
    );
  }
}

class TextCenter extends StatelessWidget {
  final Function press;
  final String title;
  final Color color;
  TextCenter({this.color, this.press, this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Text(
          title,
          style: descpTextStyle(color: color),
        ),
      ),
    );
  }
}

class TextFormCenter extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function validate;
  final Function onSaved;
  final TextInputType type;
  final bool obs;
  final bool auto;

  const TextFormCenter({
    this.title,
    this.iconData,
    this.validate,
    this.onSaved,
    this.type,
    this.obs,
    this.auto,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(-0.9, -0.03),
      width: double.infinity,
      height: 51.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Color(0xffFFFFFF),
        border: Border.all(width: 1, color: const Color(0xffC3D9F5)
            // color: const Color(0xFFC3D9F5),
            ),
      ),
      child: TextFormField(
        obscureText: obs,
        autofocus: auto,
        onSaved: onSaved,
        validator: validate,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData, color: Color(0xffC3CCDB)),
          hintText: title,
          hintStyle: hintTextStyle(),
        ),
      ),
    );
  }
}
