// import 'package:flutter/material.dart';
// import 'package:skool_management/map.dart';
// import 'package:skool_management/widgets/themes/colors/app_colors.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(130),
//         child: AppBar(
//           backgroundColor: kcPrimary,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Padding(
//             padding: const EdgeInsets.only(top: 50.0), 
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16.0, top: 20.0), 
//                   child: const Text(
//                     "Logo",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 16.0, top: 20.0), 
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     child: IconButton(
//                       icon: const Icon(Icons.notification_add_rounded , color: kcPrimary),
//                       onPressed: () {
//                         print("Notification icon tapped!");
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             ProfileCard(
//               imagePath: 'assets/sam.png',
//               name: 'Samuel M S',
//               subtitle: '11 th grade  |  Roll no : 24',
//             ),
//             SizedBox(height: 16),
//             ProfileCard(
//               imagePath: 'assets/jz.png',
//               name: 'Pooja Padmakumar',
//               subtitle: '12 th grade  |  Roll no : 22',
//             ),
           
// Card(
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(16),
//   ),
//   child: Container(
//     width: double.infinity,
//     padding: EdgeInsets.all(24),
//     decoration: BoxDecoration(
//       color: kcPrimary,
//       borderRadius: BorderRadius.circular(16),
//     ),
//     child: Row(
//       children: [
//         Expanded(
//           flex: 4,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Bus Tracking',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'Track your child\'s school bus journey in real-time, from home to school and back!',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 9,
//                 ),
//                 maxLines: 4,
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                    Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => RealTimeTrackingPage()),
//               );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                 ),
//                 child: Text(
//                   'Click Here',
//                   style: TextStyle(
//                     color: kcPrimary,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 3,
//           child: Image.asset(
//             'assets/bustrack.png',
//             fit: BoxFit.contain,
//           ),
//         ),
//       ],
//     ),
//   ),
// )
//           ],
//         ),
//       ),
      
//     );
//   }
// }

// class ProfileCard extends StatelessWidget {
//   final String imagePath;
//   final String name;
//   final String subtitle;

//   const ProfileCard({
//     super.key,
//     required this.imagePath,
//     required this.name,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         elevation: 4,
//         color: kcPrimary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 30,
//                 backgroundColor: Colors.white,
//                 child: ClipOval(
//                   child: Image.asset(
//                     imagePath,
//                     width: 60,
//                     height: 60,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     subtitle,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
      
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:skool_management/map.dart';
import 'package:skool_management/screens/home/academic_dashboard.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
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
                      icon: const Icon(Icons.notification_add_rounded , color: kcPrimary),
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ProfileCard(
              imagePath: 'assets/sam.png',
              name: 'Samuel M S',
              subtitle: '11 th grade  |  Roll no : 24',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileDetailsPage(
                      imagePath: 'assets/sam.png',
                      name: 'Samuel M S',
                      subtitle: '11 th grade  |  Roll no : 24',
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ProfileCard(
              imagePath: 'assets/jz.png',
              name: 'Pooja Padmakumar',
              subtitle: '12 th grade  |  Roll no : 22',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileDetailsPage(
                      imagePath: 'assets/jz.png',
                      name: 'Pooja Padmakumar',
                      subtitle: '12 th grade  |  Roll no : 22',
                    ),
                  ),
                );
              },
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: kcPrimary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bus Tracking',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Track your child\'s school bus journey in real-time, from home to school and back!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                            maxLines: 4,
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RealTimeTrackingPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Text(
                              'Click Here',
                              style: TextStyle(
                                color: kcPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        'assets/bustrack.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;
  final VoidCallback onTap;
  final Color color;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.onTap,
    this.color = kcPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 4,
          color: color, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileDetailsPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;

  const ProfileDetailsPage({
    super.key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimary,
        title: const Text("Profile Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ProfileCard(
                imagePath: imagePath,
                name: name,
                subtitle: subtitle,
                onTap: () {}, 
                color: Colors.black, 
                
              ),
            ),
            const SizedBox(height: 16),
           
            AcademicDashboard()
          ],
        ),
      ),
    );
  }
}
