import 'package:flutter/material.dart';
import 'package:skool_management/screens/profile/mailopen.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          Text("Reset password",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text("Enter the email associated with your account and we'll send an email with instructions to reset your password.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.grey),),
          SizedBox(height: 30,),
          Text("Email Address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: 'abcd12@gmail.com',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kcPrimary), 
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kcPrimary), 
              ),
              border: OutlineInputBorder(), 
            ),),
SizedBox(height: 30,),
             Center(
               child: ElevatedButton(
                           onPressed: () {
                
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkmailscreen()),
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
                "Send mail",
                style: TextStyle(color: Colors.white),
                           ),
                         ),
             ),
        ],),
      ),
    );
  }
}