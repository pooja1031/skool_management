import 'package:flutter/material.dart';
import 'package:skool_management/screens/profile/changepassword.dart';
import 'package:skool_management/screens/profile/gethelp.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, String>> items = [
    {
      'name': 'Change Password',
      'image': 'assets/logg.png',
    },
    {
      'name': 'Get Help',
      'image': 'assets/gethelp.png',  
    },
    {
      'name': 'Theme',
      //'image': '',  
    },
    {
      'name': 'Log out',
      'image': 'assets/logout.png',  
    },
  ];

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    elevation: 5,
                    color: kcPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3), 
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/propic.png', 
                                width: 75,
                                height: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Mrs. Jessica Markus',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            '( 1234567890 )',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: items.length,
  itemBuilder: (context, index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePasswordPage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GetHelpPage()),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 197, 195, 195)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          tileColor: Colors.grey[100],
          leading: index == 2
              ? Material(
                  elevation: 4,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: kcPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
              : Material(
                  elevation: 4,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: ClipOval(
                      child: Image.asset(
                        items[index]['image'] ?? '',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
          title: Text(
            items[index]['name'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: index < 2
              ? IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  onPressed: () {
                   
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetHelpPage()),
                      );
                    }
                  },
                )
              : null,
        ),
      ),
    );
  },
),


              SizedBox(height: 160,)
            ],
          ),
        ),
      ),
    );
  }
}




