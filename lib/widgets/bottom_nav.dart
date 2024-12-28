// import 'package:flutter/material.dart';
// import 'package:skool_management/screens/events/events.dart';
// import 'package:skool_management/screens/home/home.dart';
// import 'package:skool_management/screens/library/library.dart';
// import 'package:skool_management/screens/profile/profile.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   static final List<Widget> _pages = [
//     const HomePage(),
//     const EventPage(),
//     const LibraryPage(),
//     const ProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _pages[_selectedIndex],
//           Positioned(
//             left: 20,
//             right: 20,
//             bottom: 20,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(25),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     spreadRadius: 2,
//                     blurRadius: 10,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(25),
//                 child: BottomNavigationBar(
//                   backgroundColor: Colors.black,
//                   type: BottomNavigationBarType.fixed,
//                   currentIndex: _selectedIndex,
//                   onTap: _onItemTapped,
//                   selectedItemColor: Colors.white,
//                   unselectedItemColor: Colors.grey,
//                   elevation: 0,
//                   items: [
//                     BottomNavigationBarItem(
//                       icon: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _selectedIndex == 0 ? Colors.blue.withOpacity(0.2) : Colors.transparent,
//                         ),
//                         child: const Icon(Icons.home),
//                       ),
//                       label: 'Home',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _selectedIndex == 1 ? Colors.blue.withOpacity(0.2) : Colors.transparent,
//                         ),
//                         child: const Icon(Icons.event),
//                       ),
//                       label: 'Events',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _selectedIndex == 2 ? Colors.blue.withOpacity(0.2) : Colors.transparent,
//                         ),
//                         child: const Icon(Icons.library_books),
//                       ),
//                       label: 'Library',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _selectedIndex == 3 ? Colors.blue.withOpacity(0.2) : Colors.transparent,
//                         ),
//                         child: const Icon(Icons.person),
//                       ),
//                       label: 'Profile',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skool_management/screens/events/events.dart';
import 'package:skool_management/screens/home/home.dart';
import 'package:skool_management/screens/library/library.dart';
import 'package:skool_management/screens/profile/profile.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const HomePage(),
    const EventPage(),
    const LibraryPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BottomNavigationBar(
                  backgroundColor: Colors.black,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 0 ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                        ),
                        child: SvgPicture.asset(
                          'assets/Home-01.svg',
                          color: _selectedIndex == 0 ? kcPrimary : Colors.grey,
                          width: 30, 
                          height: 30,
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 1 ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                        ),
                        child: SvgPicture.asset(
                          'assets/Event.svg',
                          color: _selectedIndex == 1 ? kcPrimary : Colors.grey,
                          width: 30, 
                          height: 30, 
                        ),
                      ),
                      label: 'Events',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 2 ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                        ),
                        child: SvgPicture.asset(
                          'assets/Library-01.svg',
                          color: _selectedIndex == 2 ? kcPrimary : Colors.grey,
                          width: 30, 
                          height: 30, 
                        ),
                      ),
                      label: 'Library',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 3 ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                        ),
                        child: SvgPicture.asset(
                          'assets/Profile-01.svg',
                          color: _selectedIndex == 3 ? kcPrimary : Colors.grey,
                          width: 30, 
                          height: 30, 
                        ),
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
