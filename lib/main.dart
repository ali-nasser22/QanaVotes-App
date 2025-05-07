import 'package:flutter/material.dart';
import 'package:qanavotes_app/screens/guidance/election_guidance_screen.dart';
import 'package:qanavotes_app/screens/leaderboard/leaderboard_screen.dart';
import 'package:qanavotes_app/screens/login/login_screen.dart';
import 'package:qanavotes_app/screens/map/map_screen.dart';
import 'package:qanavotes_app/screens/profile/profile_screen.dart';

import 'screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qana Votes',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/leaderboard': (context) => const LeaderboardScreen(),
        '/guidance': (context) => const ElectionGuidanceScreen(),
        '/map': (context) => const MapScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      home: WelcomeScreen(),
    );
  }
}
