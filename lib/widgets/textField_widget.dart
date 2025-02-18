import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.w,
    required this.label,
    required this.obsecure,
    required this.icon,
  });
  final String label;
  final double w;
  final bool obsecure;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: w * 1,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        cursorColor: AppColors.purple,
        obscureText: obsecure,
        decoration: InputDecoration(
            labelText: label,
            fillColor: Colors.white,
            filled: true,
            suffixIcon: icon,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.transparent,
            )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
