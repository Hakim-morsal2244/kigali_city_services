import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/listing_provider.dart';
import 'detail_screen.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({super.key});

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  String searchQuery = '';
  String? filterCategory;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListingProvider>(context);
    final listings = provider.search(searchQuery, filterCategory);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Directory"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search by name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) => setState(() => searchQuery = val),
                ),
                const SizedBox(height: 8),
                DropdownButton<String>(
                  value: filterCategory,
                  hint: const Text("Filter by category"),
                  items: [
                    'Hospital',
                    'Police Station',
                    'Library',
                    'Restaurant',
                    'Café',
                    'Park',
                    'Tourist Attraction',
                  ].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (val) => setState(() => filterCategory = val),
                ),
              ],
            ),
          ),
        ),
      ),
      body: listings.isEmpty
          ? const Center(child: Text("No listings found"))
          : ListView.builder(
              itemCount: listings.length,
              itemBuilder: (_, index) {
                final item = listings[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['category']),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(listing: item),
                    ),
                  ),
                );
              },
            ),
    );
  }
}