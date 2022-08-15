import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  TextEditingController? textEditingController;
  String? hintText;
  Function(dynamic)? onChanged;
  String? Function(String?)? validator;
  Function()? onEditingComplete;
  var keyboard;
  int? maxLines;
  bool? obscureText;
  Color? fillColor;
  String? labelTitle;
  TextFormWidget(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.onEditingComplete,
      this.obscureText,
      this.keyboard,
      this.maxLines,
      this.fillColor,
      this.labelTitle,
      this.textEditingController,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(hintText: hintText,label: Text(labelTitle!),
      fillColor: fillColor,),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboard ?? TextInputType.text,
      maxLines: maxLines ?? 1,
      validator: validator,
      obscureText: obscureText ?? false,
    );
  }
}
