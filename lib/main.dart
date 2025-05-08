import 'package:flutter/material.dart';
import 'package:qanavotes_app/models/user.dart';
import 'package:qanavotes_app/screens/candidates/candidates_list_screen.dart';
import 'package:qanavotes_app/screens/guidance/election_guidance_screen.dart';
import 'package:qanavotes_app/screens/leaderboard/leaderboard_screen.dart';
import 'package:qanavotes_app/screens/login/login_screen.dart';
import 'package:qanavotes_app/screens/map/map_screen.dart';
import 'package:qanavotes_app/screens/profile/profile_screen.dart';
import 'package:qanavotes_app/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qana Votes',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        final args = settings.arguments;
        final hasValidArgs =
            args is Map<String, dynamic> &&
            args['user'] is User &&
            args['token'] is String;

        switch (settings.name) {
          case '/candidates':
            if (hasValidArgs) {
              return MaterialPageRoute(
                builder:
                    (_) => CandidatesListScreen(
                      user: args['user'],
                      token: args['token'],
                    ),
              );
            }
            return MaterialPageRoute(builder: (_) => const LoginScreen());

          case '/leaderboard':
            if (hasValidArgs) {
              return MaterialPageRoute(
                builder:
                    (_) => LeaderboardScreen(
                      user: args['user'],
                      token: args['token'],
                    ),
              );
            }
            return MaterialPageRoute(builder: (_) => const LoginScreen());

          case '/guidance':
            if (hasValidArgs) {
              return MaterialPageRoute(
                builder:
                    (_) => ElectionGuidanceScreen(
                      user: args['user'],
                      token: args['token'],
                    ),
              );
            }
            return MaterialPageRoute(builder: (_) => const LoginScreen());

          case '/map':
            if (hasValidArgs) {
              return MaterialPageRoute(
                builder:
                    (_) => MapScreen(user: args['user'], token: args['token']),
              );
            }
            return MaterialPageRoute(builder: (_) => const LoginScreen());

          case '/profile':
            if (hasValidArgs) {
              return MaterialPageRoute(
                builder:
                    (_) =>
                        ProfileScreen(user: args['user'], token: args['token']),
              );
            }
            return MaterialPageRoute(builder: (_) => const LoginScreen());

          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginScreen());

          default:
            return MaterialPageRoute(builder: (_) => const WelcomeScreen());
        }
      },
    );
  }
}
