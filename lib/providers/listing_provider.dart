import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListingProvider extends ChangeNotifier {
  final CollectionReference listings =
      FirebaseFirestore.instance.collection('listings');

  List<Map<String, dynamic>> _items = [];
  List<Map<String, dynamic>> get items => _items;

  ListingProvider() {
    _fetchListings();
  }

  Future<void> _fetchListings() async {
    listings.snapshots().listen((snapshot) {
      _items = snapshot.docs.map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>}).toList();
      notifyListeners();
    });
  }

  Future<void> addListing({
    required String name,
    required String category,
    required String address,
    required String contact,
    required String description,
    required double lat,
    required double lng,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await listings.add({
      'name': name,
      'category': category,
      'address': address,
      'contact': contact,
      'description': description,
      'lat': lat,
      'lng': lng,
      'createdBy': uid,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> updateListing(String id, Map<String, dynamic> data) async {
    await listings.doc(id).update(data);
  }

  Future<void> deleteListing(String id) async {
    await listings.doc(id).delete();
  }

  List<Map<String, dynamic>> search(String query, String? category) {
    return _items.where((item) {
      final matchesQuery = item['name'].toLowerCase().contains(query.toLowerCase());
      final matchesCategory = category == null || category == '' || item['category'] == category;
      return matchesQuery && matchesCategory;
    }).toList();
  }
}