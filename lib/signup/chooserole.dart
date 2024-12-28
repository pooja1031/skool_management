import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skool_management/signup/signup.dart';
import 'package:skool_management/student/studentlogin.dart';
import 'package:skool_management/teeacher.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';
import 'package:skool_management/widgets/themes/typography/text_styles.dart';

class ChooseroleScreen extends StatefulWidget {
  const ChooseroleScreen({super.key});

  @override
  State<ChooseroleScreen> createState() => _ChooseroleScreenState();
}

class _ChooseroleScreenState extends State<ChooseroleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kcPrimary,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 170.0),
                  child: Center(
                    child: Text(
                      "Sign In as",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      'assets/Parent.svg',
                      width: 35,
                      height: 35,
                      color: kcPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Parent/Guardian", style: bodyTextStyle),
                const SizedBox(height: 45),
                Row(
                  children: [
                    const SizedBox(width: 35),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              'assets/Student-01.svg',
                              width: 35,
                              height: 35,
                              color: kcPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Student", style: bodyTextStyle)
                      ],
                    ),
                    const SizedBox(width: 35),
                    Column(
                      children: [
                        GestureDetector(
                           onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignupBackground(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              'assets/Teacher-01.svg',
                              width: 35,
                              height: 35,
                              color: kcPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Teacher", style: bodyTextStyle)
                      ],
                    ),
                    const SizedBox(width: 35),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/Driver-01.svg',
                            width: 35,
                            height: 35,
                            color: kcPrimary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Private driver", style: bodyTextStyle)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}