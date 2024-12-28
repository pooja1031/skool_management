// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class OSMMapPage extends StatefulWidget {
//   @override
//   _OSMMapPageState createState() => _OSMMapPageState();
// }

// class _OSMMapPageState extends State<OSMMapPage> {
//   final LatLng currentLocation = LatLng(9.9312, 76.2673); // Replace with your location
//   final LatLng destinationLocation = LatLng(9.9816, 76.2999); // Replace with your location

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OSM Tracking Example'),
//       ),
//       body: FlutterMap(
//         options: MapOptions(
//           initialCenter: currentLocation, // Updated to 'initialCenter'
//           initialZoom: 13.0, // Updated to 'initialZoom'
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 point: currentLocation,
//                 child: Icon(
//                   Icons.location_pin,
//                   color: Colors.green,
//                   size: 40,
//                 ),
//               ),
//               Marker(
//                 point: destinationLocation,
//                 child: Icon(
//                   Icons.location_pin,
//                   color: Colors.red,
//                   size: 40,
//                 ),
//               ),
//             ],
//           ),
//           PolylineLayer(
//             polylines: [
//               Polyline(
//                 points: [currentLocation, destinationLocation],
//                 strokeWidth: 4.0,
//                 color: Colors.blue,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class RealTimeTrackingPage extends StatefulWidget {
  @override
  _RealTimeTrackingPageState createState() => _RealTimeTrackingPageState();
}

class _RealTimeTrackingPageState extends State<RealTimeTrackingPage> {
  LatLng currentLocation = LatLng(9.9312, 76.2673); 
  LatLng destinationLocation = LatLng(9.9816, 76.2999); 
  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    super.initState();
    startTracking();
  }

  void startTracking() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Location services are disabled."),
      ));
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Location permissions are permanently denied."),
        ));
        return;
      }
    }

    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    });
  }

  @override
  void dispose() {
    positionStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FlutterMap(
        options: MapOptions(
          initialCenter: currentLocation,
          initialZoom: 15.0,
interactionOptions: InteractionOptions(
      flags: InteractiveFlag.drag | InteractiveFlag.pinchZoom,
  ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: currentLocation,
                width: 50,
                height: 50,
                child: Icon(
                  Icons.directions_car,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
              Marker(
                point: destinationLocation,
                width: 50,
                height: 50,
                child: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: [currentLocation, destinationLocation],
                strokeWidth: 4.0,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
