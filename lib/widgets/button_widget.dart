import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  Function()? onPressed;
  Widget? widget;
  double? width;
  double? height;
  Color? borderColor;
  ButtonWidget({Key? key,this.onPressed,this.widget,this.borderColor,this.width,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: widget,
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor!)
      ),
    );
  }
}