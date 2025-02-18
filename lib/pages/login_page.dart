import 'package:auto_size_text/auto_size_text.dart';
import 'package:responsive_app1/pages/home_page.dart';
import 'package:responsive_app1/theme/app_colors.dart';
import 'package:responsive_app1/widgets/textField_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/login_option_widget.dart';
import '../widgets/responsive_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final fontSize =
        (MediaQuery.of(context).size.width * 0.02).clamp(16.0, 32.0);
    final isMobile = ResponsiveWidget.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.grey,
      drawer: isMobile ? null : Drawer(child: buildSidePicture()),
      body: ResponsiveWidget(
          mobile: buildMobile(w, h, fontSize),
          tablet: buildTablet(w, h, fontSize),
          desktop: buildDesktop(w, h, fontSize)),
    );
  }

  SingleChildScrollView buildMobile(double w, double h, double fontSize) {
    return buildLogin(w, h, fontSize);
  }

  Row buildDesktop(double w, double h, double fontSize) {
    return Row(
      children: [
        Expanded(flex: 3, child: buildSidePicture()),
        Expanded(flex: 3, child: buildLogin(w, h, fontSize)),
      ],
    );
  }

  Row buildTablet(double w, double h, double fontSize) {
    return Row(
      children: [
        Expanded(flex: 2, child: buildSidePicture()),
        Expanded(flex: 3, child: buildLogin(w, h, fontSize)),
      ],
    );
  }

  SizedBox buildSidePicture() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/image.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  SingleChildScrollView buildLogin(double w, double h, double fontSize) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: h * 1,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                AutoSizeText(
                  'Welcome',
                  minFontSize: 46,
                  maxFontSize: 62,
                  style: TextStyle(
                      color: AppColors.deeppurple,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                  'Login with Email',
                  minFontSize: 10,
                  maxFontSize: 18,
                  style: TextStyle(
                      color: AppColors.lightblack,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h * 0.07,
                ),
                TextFieldWidget(
                  label: 'Email',
                  w: w,
                  obsecure: false,
                  icon: Icon(null),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                TextFieldWidget(
                  w: w,
                  label: 'Password',
                  obsecure: true,
                  icon: Icon(
                    Icons.visibility,
                    color: AppColors.lightblack,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w * 0.02,
                    ),
                    AutoSizeText(
                      minFontSize: 8,
                      maxFontSize: 14,
                      'Forget Password?',
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w500,
                          color: AppColors.purple),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    width:
                        ResponsiveWidget.isMobile(context) ? w * 0.6 : w * 0.2,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          minFontSize: 8,
                          maxFontSize: 14,
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(color: AppColors.purple, thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: AutoSizeText(
                        'or',
                        minFontSize: 16,
                        maxFontSize: 32,
                        style: TextStyle(
                            fontSize: fontSize, color: AppColors.purple),
                      ),
                    ),
                    Expanded(
                        child: Divider(color: AppColors.purple, thickness: 1)),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginOption(
                      img: 'assets/icons/ad 2.png',
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    LoginOption(
                      img: 'assets/icons/logos_facebook.png',
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    LoginOption(
                      img: 'assets/icons/Phone.png',
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      minFontSize: 8,
                      maxFontSize: 14,
                      'Don\'t have an account? ',
                      style:
                          TextStyle(fontSize: fontSize, color: AppColors.black),
                    ),
                    AutoSizeText(
                      minFontSize: 8,
                      maxFontSize: 14,
                      'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          color: AppColors.purple),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
