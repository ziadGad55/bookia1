import 'package:bookia1/core/fonts/font_style.dart';
import 'package:flutter/material.dart';

class field extends StatelessWidget {
  const field({
    super.key,
    this.inputcontroller,
    this.hint,
    this.line,
    this.icon,
  });

  final TextEditingController? inputcontroller;
  final String? hint;
  final int? line;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
          decoration: InputDecoration(
              fillColor: Color(0xffF7F8F9),
              filled: true,
              hintStyle: appTextStyle(size: 15, color: Color(0xff8391A1)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
    );
  }
}
