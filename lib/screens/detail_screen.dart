import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> listing;

  const DetailScreen({super.key, required this.listing});

  void _launchMaps() async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=${listing['lat']},${listing['lng']}';
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(listing['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Category: ${listing['category']}"),
            Text("Address: ${listing['address']}"),
            Text("Contact: ${listing['contact']}"),
            Text("Description: ${listing['description']}"),
            const SizedBox(height: 20),
            Expanded(
              child: kIsWeb
                  ? const Center(child: Text("Map not supported on web"))
                  : const Center(child: Text("Google Map placeholder for mobile")),
            ),
            ElevatedButton.icon(
              onPressed: _launchMaps,
              icon: const Icon(Icons.directions),
              label: const Text("Open in Google Maps"),
            ),
          ],
        ),
      ),
    );
  }
}