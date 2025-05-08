import 'package:flutter/material.dart';
import 'package:qanavotes_app/models/user.dart';

import '../../screens/guidance/election_guidance_screen.dart';
import '../../screens/leaderboard/leaderboard_screen.dart';
import '../../screens/map/map_screen.dart';
import '../../screens/profile/profile_screen.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final User user;
  final String token;

  const MainScaffold({
    super.key,
    required this.child,
    required this.title,
    required this.user,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF3F51B5)),
              child: Text(
                'QanaVotes Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.how_to_vote),
              title: const Text('Candidates'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/candidates',
                  arguments: {'user': user, 'token': token},
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.leaderboard),
              title: const Text('Leaderboard'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LeaderboardScreen(user: user, token: token),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Guidance'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => ElectionGuidanceScreen(user: user, token: token),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.map_outlined),
              title: const Text('Map'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MapScreen(user: user, token: token),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(user: user, token: token),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
