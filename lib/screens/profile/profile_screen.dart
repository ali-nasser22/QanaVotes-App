import 'package:flutter/material.dart';
import 'package:qanavotes_app/core/widgets/main_scaffold.dart';
import 'package:qanavotes_app/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  final String token;

  const ProfileScreen({super.key, required this.user, required this.token});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Profile',
      user: user,
      token: token,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 45, color: Colors.white),
            ),
            const SizedBox(height: 24),
            _profileItem('Full Name', user.fullName),
            const SizedBox(height: 12),
            _profileItem('Login ID', user.loginId),
            const SizedBox(height: 12),
            _profileItem('SSN', user.ssn),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
