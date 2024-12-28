import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:skool_management/screens/profile/profile_creation.dart';
import 'package:skool_management/signup/signup.dart';
import 'package:skool_management/widgets/clipperbackground/customclipper.dart';
import 'package:skool_management/widgets/textfield/textfield.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';
import 'package:skool_management/widgets/themes/typography/text_styles.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  void _showCustomAlertBox(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(0, 18, 17, 17),
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 40), 
                    Lottie.asset(
                "animations/tick.json"),
                    const Text(
                      "Registered Successfully as Parent",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: const Text(
                            "Go to dashboard",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                                            const SizedBox(width: 20),

                        TextButton(
                      onPressed: () {
                       Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ProfileCreationScreen()),
                    );
                      },
                      
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 16,
                          color:kcPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Positioned(
                top: -10,
                right: -10,
                child: IconButton(
                  icon: const Icon(Icons.cancel_outlined, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
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
          
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60,),
                  Text(
                    "Verification",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
          'assets/verification.png',
          width: 200, 
          height: 200, 
          fit: BoxFit.cover, 
        ),
                 
                  const SizedBox(height: 40),
                  


                  
                  Text(
                    "Enter Verification Code",
                    style:TextStyle(color: kcPrimary,fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                  const SizedBox(height: 15),
                  Pinput(
                    length: 4, // Only 4 fields
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kcPrimary),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kcPrimary, width: 2),
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: kcPrimary,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kcPrimary),
                      ),
                    ),
                    onCompleted: (code) {
                      print("Verification code entered: $code");
                    },
                  ),
                  SizedBox(height: 20,),
                  Text("enter verification code sent to mobile number",style: TextStyle(fontSize: 15),),
                                    SizedBox(height: 20,),

                  Text("7358****30",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black),),
                                                      SizedBox(height: 20,),

                  Row(
                    children: [
                      Text("Haven’t  received  the verification code ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: kcPrimary),),
                     SizedBox(width: 15,),
                      Text("Resend",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)
                    ],
                  ),
                  SizedBox(height: 20,),
ElevatedButton(
            onPressed: () {
              
                                    _showCustomAlertBox(context);

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kcPrimary,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            child: Text(
              "Verify",
              style: TextStyle(color: Colors.white),
            ),
          ),  
                        ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}