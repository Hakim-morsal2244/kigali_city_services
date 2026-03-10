import 'package:flutter/material.dart';

class AddListingScreen extends StatelessWidget {

  const AddListingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Location"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ListView(

          children: const [

            TextField(
              decoration: InputDecoration(
                labelText: "Place Name",
              ),
            ),

            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                labelText: "Category",
              ),
            ),

            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                labelText: "Address",
              ),
            ),

            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                labelText: "Contact Number",
              ),
            ),

            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                labelText: "Description",
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: null,
              child: Text("Save Listing"),
            ),

          ],
        ),
      ),
    );
  }
}