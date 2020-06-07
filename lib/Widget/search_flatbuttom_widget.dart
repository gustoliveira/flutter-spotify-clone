import 'package:flutter/material.dart';

class CustomTextFieldFlatButtom extends StatelessWidget {
  final EdgeInsets buttomPadding;
  final String hintText;
  final TextStyle hintTextStyle;
  final Function onPressed;
  final bool haveSuffix;
  final EdgeInsets suffixPadding;
  final Widget suffixIcon;
  final bool havePrefix;
  final Widget prefixIcon;
  final EdgeInsets prefixPadding;
  final double height;
  final double width;
  final Color backgroundColor;

  CustomTextFieldFlatButtom(
      {this.hintText,
      this.buttomPadding,
      this.hintTextStyle,
      this.onPressed,
      this.haveSuffix = false,
      this.suffixIcon,
      this.suffixPadding,
      this.havePrefix = false,
      this.prefixIcon,
      this.prefixPadding,
      this.height = 50,
      this.width = 300,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: buttomPadding,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: backgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: prefixPadding,
                    child: prefixIcon,
                  ),
                  FlatButton(
                    splashColor: Colors.transparent,
                    child: Text(hintText, style: hintTextStyle),
                    onPressed: onPressed,
                  )
                ],
              ),
            ),
          ),
          haveSuffix
              ? Padding(
                  padding: suffixPadding,
                  child: suffixIcon,
                )
              : Container()
        ],
      ),
    );
  }
}
