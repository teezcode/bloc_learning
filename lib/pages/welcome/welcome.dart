import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/common/values/colors.dart';
import 'package:ulearning_bloc/main.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 38.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvents());
                    },
                    children: [
                      _page(
                        index: 1,
                        btnName: "Next",
                        title: "First see learning",
                        subTitle: "Forget about a for of pape all knowledge in one learning",
                        imagePath: "assets/images/reading.png",
                        pageController: pageController,
                      ),
                      _page(
                        index: 2,
                        btnName: "Next",
                        title: "Connect with people",
                        subTitle: "Always keep in touch with your loved ones",
                        imagePath: "assets/images/boy.png",
                        pageController: pageController,
                      ),
                      _page(
                        index: 3,
                        btnName: "Get Started",
                        title: "Always fun to learn",
                        subTitle: "Anyway any time learning is fun no cap",
                        imagePath: "assets/images/man.png",
                        pageController: pageController,
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: state.page.toDouble(),
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            color: AppColors.primaryThirdElementText,
                            activeColor: AppColors.primaryElement,
                            size: Size.square(8.0),
                            activeSize: Size(20.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _page extends StatelessWidget {
  final int index;
  final String title;
  final String btnName;
  final String subTitle;
  final String imagePath;
  final PageController? pageController;


  const _page({
    Key? key,
    required this.title,
    required this.btnName,
    required this.subTitle,
    required this.imagePath,
    required this.index,
    this.pageController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            )),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primaryFourthElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController?.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => MyHomePage(title: "")));
              Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2))
                ]),
            child: Center(
              child: Text(
                btnName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
