import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/pages/signIn/widgets/sign_in_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(child: reuseAbleText("Or use Your email account to Login")),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: EdgeInsets.only(left: 25.w,right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reuseAbleText("Email"),
                    SizedBox(height: 5.h),
                    buildTextField("Enter your Email", "email","user"),
                    reuseAbleText("Password"),
                    SizedBox(height: 5.h),
                    buildTextField("Enter your Password", "password","lock")
                  ],
                ),
              ),
              forgotPassword(),
              buildLoginAndRegButton("Login","login"),
              buildLoginAndRegButton("Register","register"),
            ],
          ),
        ),
      ),
    );
  }
}
