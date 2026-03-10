import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map View")),
      body: Center(
        child: kIsWeb
            ? const Text("Google Maps not supported on web")
            : const Text("Google Map placeholder for mobile"),
      ),
    );
  }
}