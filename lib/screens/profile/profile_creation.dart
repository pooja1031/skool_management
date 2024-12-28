import 'package:flutter/material.dart';
import 'package:skool_management/widgets/bottom_nav.dart';
import 'package:skool_management/widgets/clipperbackground/customclipper.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';
import 'package:skool_management/widgets/themes/typography/text_styles.dart';

class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Top Background
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
          // Profile Creation Form
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 130),
                  const Text(
                    "Profile Creation",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Avatar
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 84
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 270.0),
                    child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  _buildElevatedTextField(
                    hintText: "Name",
                    //icon: Icons.person,
                  ),
                                    const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.only(right: 260.0),
                    child: Text("Phone No",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  _buildElevatedTextField(
                    hintText: "Phone Number",
                   // icon: Icons.phone,
                  ),
                                    const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.only(right: 260.0),
                    child: Text("Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  _buildElevatedTextField(
                    hintText: "Email",
                    //icon: Icons.email,
                  ),
                                    const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.only(right: 260.0),
                    child: Text("Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  _buildElevatedTextField(
                    hintText: "Address",
                  //  icon: Icons.home,
                  ),
SizedBox(height: 20,),
                  ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
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
              "submit",
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

  Widget _buildElevatedTextField({required String hintText}) {
    return Material(
      elevation: 8, 
      shadowColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10), 
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
         // prefixIcon: Icon(icon, color: kcPrimary),
          filled: true,
          fillColor: Colors.grey[50], 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, 
          ),
        ),
      ),
    );
  }
}
