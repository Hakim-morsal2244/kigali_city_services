import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  String email = '';
  String displayName = '';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() async {
    final auth = Provider.of<AuthService>(context, listen: false);
    final doc = await auth.getUserProfile();
    setState(() {
      notificationsEnabled = doc['notifications'] ?? true;
      email = doc['email'] ?? '';
      displayName = doc['displayName'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Name: $displayName"),
            Text("Email: $email"),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text("Enable Notifications"),
              value: notificationsEnabled,
              onChanged: (val) {
                setState(() => notificationsEnabled = val);
                auth.toggleNotifications(val);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => auth.signOut(),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}