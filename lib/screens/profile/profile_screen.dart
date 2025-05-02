import 'package:flutter/material.dart';
import 'package:qanavotes_app/core/widgets/main_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String fullName = 'Ali Nasser';
    final String loginId = 'XA1283';
    final String ssn = '199833/12';

    return MainScaffold(
      title: 'Profile',
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.indigo,
              child: Icon(
                Icons.person,
                size: 45,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            ProfileItem(label: 'Full Name', value: fullName),
            const SizedBox(height: 12),
            ProfileItem(label: 'Login ID', value: loginId),
            const SizedBox(height: 12),
            ProfileItem(label: 'Civil Record #', value: ssn),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
                icon: const Icon(Icons.logout,color: Colors.white,size: 20,),
                label: const Text('Logout',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[600],
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
}

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),
        ),
      ],
    );
  }
}
