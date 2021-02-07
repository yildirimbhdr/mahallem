import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Color color;
  final Color backgroundColor;
  final double padding;
  final double borderRadius;
  final double width;
  final double height;
  final int maxLines;
  final String helperText;
  final FocusNode focusNode;
  final bool readOnly;
  final TextInputType textInputType;
  final bool isPassChar;
  final Function onTap;
  final Widget suffix;
  final Function onSubmitted;
  final String errorText;
  final int maxLength;
  final TextAlign textAlign;
  final TextStyle hintStyle;
  final String labelText;

  CustomTextFormField(
      {Key key,
      this.hintText,
      this.controller,
      this.color,
      this.borderRadius,
      this.width,
      this.height,
      this.padding,
      this.maxLines,
      this.helperText,
      this.focusNode,
      this.readOnly,
      this.textInputType,
      this.isPassChar,
      this.backgroundColor,
      this.onTap,
      this.suffix,
      this.onSubmitted,
      this.errorText,
      this.maxLength,
      this.textAlign,
      this.hintStyle,
      this.labelText})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  FocusNode focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
        borderSide: BorderSide(
            color: widget.color == null ? Colors.white : widget.color,
            width: 2));
    return Center(
      child: Container(
        width: widget.width == null ? 350 : widget.width,
        margin: EdgeInsets.all(widget.padding == null ? 20 : widget.padding),
        child: TextFormField(
          style: widget.hintStyle ??
              TextStyle(
                color: Colors.black,
                height: widget.height ?? 1.5,
              ),
          onChanged: (text) {
            if (text.endsWith(" ") && text.isNotEmpty && text.length > 5) {
              widget.onSubmitted(text.trim());
            }
          },
          maxLength: widget.maxLength,
          onTap: widget.onTap ?? null,
          onFieldSubmitted: widget.onSubmitted,
          obscureText: widget.isPassChar ?? false,
          keyboardType: widget.textInputType ?? TextInputType.text,
          readOnly: widget.readOnly ?? false,
          focusNode: widget.focusNode == null ? focusNode : widget.focusNode,
          maxLines: widget.maxLines == null ? 1 : widget.maxLines,
          controller: widget.controller == null
              ? TextEditingController()
              : widget.controller,
          textAlign: widget.textAlign ?? TextAlign.left,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.height ?? 20, horizontal: 10),
              errorText: widget.errorText,
              isCollapsed: true,
              fillColor: widget.backgroundColor ?? Colors.white,
              suffixIcon: widget.suffix ??
                  null ??
                  null,
              filled: widget.backgroundColor != null ? true : true,
              helperText: widget.helperText == null ? ' ' : widget.helperText,
              hintText: widget.hintText == null ? '' : widget.hintText,
              border: _outlineInputBorder,
              hintStyle: widget.hintStyle ?? TextStyle(color: Colors.black),
              enabledBorder: _outlineInputBorder,
              focusedBorder: _outlineInputBorder),
        ),
      ),
    );
  }
}
