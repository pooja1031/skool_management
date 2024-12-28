import 'package:flutter/material.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class GetHelpPage extends StatefulWidget {
  const GetHelpPage({super.key});

  @override
  State<GetHelpPage> createState() => _GetHelpPageState();
}

class _GetHelpPageState extends State<GetHelpPage> {
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
    );
  }
}