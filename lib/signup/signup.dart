import 'package:flutter/material.dart';
import 'package:skool_management/widgets/clipperbackground/customclipper.dart';
import 'package:skool_management/widgets/textfield/textfield.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';
import 'package:skool_management/widgets/themes/typography/text_styles.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: kcPrimary,
      resizeToAvoidBottomInset: true, 
      body: Stack(
        children: [
          
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomWaveClipper(reverse: true),
              child: Container(
                height: MediaQuery.of(context).size.height / 2, 
                color: kcPrimary, 
              ),
            ),
          ),
          
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 130,),
                  Text(
                    "Sign In as",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  
                  // Avatar
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.people,
                      size: 40,
                      color: kcPrimary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  Text(
                    "Parent/Guardian",
                    style: header4Style,
                  ),
                  const SizedBox(height: 45),
                  
                  LoginForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



