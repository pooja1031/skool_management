// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// // Theme provider to manage app-wide state
// class ThemeProvider extends ChangeNotifier {
//   Color _primaryColor = const Color(0xFF009688); // Default teal color

//   Color get primaryColor => _primaryColor;

//   void updatePrimaryColor(Color newColor) {
//     _primaryColor = newColor;
//     notifyListeners();
//   }
// }

// // Color picker dialog
// void showColorPickerDialog(BuildContext context, ThemeProvider themeProvider) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       Color pickerColor = themeProvider.primaryColor;
      
//       return AlertDialog(
//         title: const Text('Pick a color'),
//         content: SingleChildScrollView(
//           child: ColorPicker(
//             pickerColor: pickerColor,
//             onColorChanged: (Color color) {
//               pickerColor = color;
//             },
//             pickerAreaHeightPercent: 0.8,
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text('Apply'),
//             onPressed: () {
//               themeProvider.updatePrimaryColor(pickerColor);
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// // Modified HomePage
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
    
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(130),
//         child: AppBar(
//           backgroundColor: themeProvider.primaryColor, // Use dynamic color
//           // ... rest of your AppBar code ...
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             // ... your existing widgets ...
//             ListTile(
//               title: const Text('Theme'),
//               trailing: const Icon(Icons.chevron_right),
//               onTap: () => showColorPickerDialog(context, themeProvider),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }