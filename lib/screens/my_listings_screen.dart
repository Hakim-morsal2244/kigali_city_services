import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/listing_provider.dart';
import 'detail_screen.dart';

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListingProvider>(context);
    final uid = provider.items.isEmpty ? '' : provider.items.first['createdBy'];

    final myListings = provider.items.where((e) => e['createdBy'] == uid).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("My Listings")),
      body: myListings.isEmpty
          ? const Center(child: Text("No listings created"))
          : ListView.builder(
              itemCount: myListings.length,
              itemBuilder: (_, index) {
                final item = myListings[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['category']),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(listing: item),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => provider.deleteListing(item['id']),
                  ),
                );
              },
            ),
    );
  }
}