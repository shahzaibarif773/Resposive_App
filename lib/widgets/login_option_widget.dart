import 'package:auto_size_text/auto_size_text.dart';
import 'package:responsive_app1/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class LoginOption extends StatelessWidget {
  final String img;
  const LoginOption({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final isMobile = ResponsiveWidget.isMobile(context);

    return Container(
      height: h * 0.08,
      width: isMobile ? w * 0.12 : w * 0.05,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.lightpurple,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Image.asset(
        img,
        height: MediaQuery.of(context).size.height * 0.04,
        width: w * 0.08,
      ),
    );
  }
}
