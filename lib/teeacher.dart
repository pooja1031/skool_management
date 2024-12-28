import 'package:flutter/material.dart';
import 'package:skool_management/widgets/clipperbackground/customclipper.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class SignupBackground extends StatelessWidget {
  const SignupBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
