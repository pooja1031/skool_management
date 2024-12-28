import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skool_management/screens/profile/newpassword.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class Checkmailscreen extends StatefulWidget {
  const Checkmailscreen({super.key});

  @override
  State<Checkmailscreen> createState() => _CheckmailscreenState();
}

class _CheckmailscreenState extends State<Checkmailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: kcPrimary,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 20.0),
                  child: const Text(
                    "Logo",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 20.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.notification_add_rounded,
                          color: kcPrimary),
                      onPressed: () {
                        print("Notification icon tapped!");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
 Lottie.asset(
                "animations/Animation - 1735193840142.json",
                
                width: 200, 
      height: 300, 
                ),          Text("Check  Your Mail",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("We have sent a password recover\n instructions to your email.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey),),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
                             onPressed: () {
                  
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateNewPassword()),
                  );
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
                  "Open email app",
                  style: TextStyle(color: Colors.white),
                             ),
                           ),
                                     SizedBox(height: 40,),

                           Text("Did not received the mail? Check your spam folder",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
        ],),
      ),
    );
  }
}