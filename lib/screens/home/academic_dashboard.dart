// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:skool_management/map.dart';
// import 'package:skool_management/widgets/themes/colors/app_colors.dart';

// class MenuItem {
//   final String title;
//   final String svgPath; 
//   final VoidCallback? onTap;

//   MenuItem({
//     required this.title,
//     required this.svgPath,
//     this.onTap,
//   });
// }

// class CircularMenuButton extends StatelessWidget {
//   final MenuItem item;
//   final double size;
//   final Color backgroundColor;
//   final Color iconColor;

//   const CircularMenuButton({
//     Key? key,
//     required this.item,
//     this.size = 47.0,
//     this.backgroundColor = kcPrimary,
//     this.iconColor = Colors.white,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         InkWell(
//           onTap: item.onTap,
//           borderRadius: BorderRadius.circular(size / 2),
//           child: Container(
//             width: size,
//             height: size,
//             decoration: BoxDecoration(
//               color: backgroundColor,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 8,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Center(
//               child: SvgPicture.asset(
//                 item.svgPath,
//                 width: size * 0.6, // Increased icon size
//                 height: size * 0.6, // Increased icon size
//                 colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           item.title,
//           style: const TextStyle(
//             fontSize: 11,
//             fontWeight: FontWeight.w500,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }

// class AcademicDashboard extends StatelessWidget {
//   final List<MenuItem> academicItems = [
//     MenuItem(title: 'Attendance', svgPath: 'assets/Attendance-01.svg'),
//     MenuItem(title: 'Home work', svgPath: 'assets/Homework-01.svg'),
//     MenuItem(title: 'Fee Details', svgPath: 'assets/Fee Detail-01.svg'),
//     MenuItem(title: 'Result', svgPath: 'assets/Result-01.svg'),
//   ];

//   final List<MenuItem> quickAccessItems = [
//     MenuItem(title: 'Time Table', svgPath: 'assets/Timetable-01.svg'),
//     MenuItem(title: 'LMS', svgPath: 'assets/LMS-01.svg'),
//     MenuItem(title: 'Resources', svgPath: 'assets/icons/resources.svg'),
//     MenuItem(title: 'Exams', svgPath: 'assets/Exam-01.svg'),
//     MenuItem(title: 'Leave Request', svgPath: 'assets/Leave Request-01.svg'),
//     MenuItem(title: 'Teacher Info', svgPath: 'assets/Teacher info-01.svg'),
//     MenuItem(title: 'Circular', svgPath: 'assets/Circular-01.svg'),
//     MenuItem(title: 'Fee Due', svgPath: 'assets/Fee due-01.svg'),
//     MenuItem(title: 'Activity', svgPath: 'assets/Activity-01.svg'),
//     MenuItem(title: 'Help', svgPath: 'assets/Help-01.svg'),
//   ];

//   AcademicDashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Academics',
//               style: TextStyle(
//                 color: kcPrimary,
//                 fontSize: 23,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 6),
//             GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 childAspectRatio: 0.8,
//               ),
//               itemCount: academicItems.length,
//               itemBuilder: (context, index) {
//                 return CircularMenuButton(item: academicItems[index]);
//               },
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'Quick Access',
//               style: TextStyle(
//                 fontSize: 23, // Fixed the small font size
//                 fontWeight: FontWeight.bold,
//                 color: kcPrimary,
//               ),
//             ),
//             const SizedBox(height: 16),
//             GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 childAspectRatio: 0.8,
//               ),
//               itemCount: quickAccessItems.length,
//               itemBuilder: (context, index) {
//                 return CircularMenuButton(item: quickAccessItems[index]);
//               },
//             ),
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(24),
//                 decoration: BoxDecoration(
//                   color: kcPrimary,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 4,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Bus Tracking',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             'Track your child\'s school bus journey in real-time, from home to school and back!',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 9,
//                             ),
//                             maxLines: 4,
//                           ),
//                           SizedBox(height: 16),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => RealTimeTrackingPage()),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(24),
//                               ),
//                             ),
//                             child: Text(
//                               'Click Here',
//                               style: TextStyle(
//                                 color: kcPrimary,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: Image.asset(
//                         'assets/bustrack.png',
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Text("Up coming Event",style: TextStyle(
//                 fontSize: 23, 
//                 fontWeight: FontWeight.bold,
//                 color: kcPrimary,
//               ),)
//           ],
//         ),
//       ),
//     );
//   }
// }





// pages/attendance_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skool_management/map.dart';
import 'package:skool_management/screens/home/attendence.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';



// pages/homework_page.dart
class HomeworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homework'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Homework Page')),
    );
  }
}

// pages/fee_details_page.dart
class FeeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Details'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Fee Details Page')),
    );
  }
}

// pages/result_page.dart
class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Result Page')),
    );
  }
}

// pages/timetable_page.dart
class TimeTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Table'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Time Table Page')),
    );
  }
}

// pages/lms_page.dart
class LMSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LMS'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('LMS Page')),
    );
  }
}

// pages/resources_page.dart
class ResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Resources Page')),
    );
  }
}

// pages/exams_page.dart
class ExamsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Exams Page')),
    );
  }
}

// pages/leave_request_page.dart
class LeaveRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Request'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Leave Request Page')),
    );
  }
}

// pages/teacher_info_page.dart
class TeacherInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Info'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Teacher Info Page')),
    );
  }
}

// pages/circular_page.dart
class CircularPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Circular Page')),
    );
  }
}

// pages/fee_due_page.dart
class FeeDuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Due'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Fee Due Page')),
    );
  }
}

// pages/activity_page.dart
class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Activity Page')),
    );
  }
}

// pages/help_page.dart
class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        backgroundColor: kcPrimary,
      ),
      body: Center(child: Text('Help Page')),
    );
  }
}

// models/menu_item.dart
class MenuItem {
  final String title;
  final String svgPath;
  final Widget destination;

  MenuItem({
    required this.title,
    required this.svgPath,
    required this.destination,
  });
}

// widgets/circular_menu_button.dart
class CircularMenuButton extends StatelessWidget {
  final MenuItem item;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const CircularMenuButton({
    Key? key,
    required this.item,
    this.size = 47.0,
    this.backgroundColor = kcPrimary,
    this.iconColor = Colors.white,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(size / 2),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                item.svgPath,
                width: size * 0.6,
                height: size * 0.6,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// screens/academic_dashboard.dart
class AcademicDashboard extends StatelessWidget {
  final List<MenuItem> academicItems = [
    MenuItem(
      title: 'Attendance',
      svgPath: 'assets/Attendance-01.svg',
      destination: AttendancePage(),
    ),
    MenuItem(
      title: 'Home work',
      svgPath: 'assets/Homework-01.svg',
      destination: HomeworkPage(),
    ),
    MenuItem(
      title: 'Fee Details',
      svgPath: 'assets/Fee Detail-01.svg',
      destination: FeeDetailsPage(),
    ),
    MenuItem(
      title: 'Result',
      svgPath: 'assets/Result-01.svg',
      destination: ResultPage(),
    ),
  ];

  final List<MenuItem> quickAccessItems = [
    MenuItem(
      title: 'Time Table',
      svgPath: 'assets/Timetable-01.svg',
      destination: TimeTablePage(),
    ),
    MenuItem(
      title: 'LMS',
      svgPath: 'assets/LMS-01.svg',
      destination: LMSPage(),
    ),
    MenuItem(
      title: 'Resources',
      svgPath: 'assets/icons/resources.svg',
      destination: ResourcesPage(),
    ),
    MenuItem(
      title: 'Exams',
      svgPath: 'assets/Exam-01.svg',
      destination: ExamsPage(),
    ),
    MenuItem(
      title: 'Leave Request',
      svgPath: 'assets/Leave Request-01.svg',
      destination: LeaveRequestPage(),
    ),
    MenuItem(
      title: 'Teacher Info',
      svgPath: 'assets/Teacher info-01.svg',
      destination: TeacherInfoPage(),
    ),
    MenuItem(
      title: 'Circular',
      svgPath: 'assets/Circular-01.svg',
      destination: CircularPage(),
    ),
    MenuItem(
      title: 'Fee Due',
      svgPath: 'assets/Fee due-01.svg',
      destination: FeeDuePage(),
    ),
    MenuItem(
      title: 'Activity',
      svgPath: 'assets/Activity-01.svg',
      destination: ActivityPage(),
    ),
    MenuItem(
      title: 'Help',
      svgPath: 'assets/Help-01.svg',
      destination: HelpPage(),
    ),
  ];

  AcademicDashboard({Key? key}) : super(key: key);

  void _navigateToPage(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Academics',
              style: TextStyle(
                color: kcPrimary,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: academicItems.length,
              itemBuilder: (context, index) {
                return CircularMenuButton(
                  item: academicItems[index],
                  onTap: () => _navigateToPage(context, academicItems[index].destination),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: kcPrimary,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: quickAccessItems.length,
              itemBuilder: (context, index) {
                return CircularMenuButton(
                  item: quickAccessItems[index],
                  onTap: () => _navigateToPage(context, quickAccessItems[index].destination),
                );
              },
            ),
            const SizedBox(height: 24),
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
            ),
            const SizedBox(height: 24),
            Text(
              "Upcoming Events",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: kcPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}