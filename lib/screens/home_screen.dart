import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/listing_provider.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                // Search bar
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search by name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (val) => setState(() => searchQuery = val),
                ),
                const SizedBox(height: 8),
                // Category filter dropdown
                DropdownButton<String>(
                  value: filterCategory,
                  hint: const Text("Filter by category"),
                  isExpanded: true,
                  items: [
                    'Hospital',
                    'Police Station',
                    'Library',
                    'Restaurant',
                    'Café',
                    'Park',
                    'Tourist Attraction',
                  ]
                      .map((c) =>
                          DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
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
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text(item['category']),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(listing: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example: add a dummy listing, you can replace with a form later
          provider.addListing(
            name: "New Service ${provider.items.length + 1}",
            category: "Restaurant",
            address: "Kigali City",
            contact: "000-000-000",
            description: "Description here",
            lat: -1.944, // example coords
            lng: 30.061,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}