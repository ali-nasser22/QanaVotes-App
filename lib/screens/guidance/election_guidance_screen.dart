import 'package:flutter/material.dart';
import 'package:qanavotes_app/core/widgets/main_scaffold.dart';

class ElectionGuidanceScreen extends StatelessWidget {
  const ElectionGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Election Guidance',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Before You Go to Vote',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            BulletText('Make sure you have your official ID or civil record number.'),
            BulletText('Check the location and opening hours of your election center.'),
            BulletText('Review candidate profiles in the app to make informed choices.'),
            BulletText('Prepare any questions you might want to ask candidates.'),

            SizedBox(height: 24),
            Text(
              'At the Election Center',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            BulletText('Arrive early to avoid long lines.'),
            BulletText('Present your valid ID to the officials at the entrance.'),
            BulletText('Follow all instructions from staff inside the center.'),
            BulletText('Respect the privacy and space of other voters.'),

            SizedBox(height: 24),
            Text(
              'After Voting',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            BulletText('Track candidate rankings in the app using the leaderboard.'),
            BulletText('Your vote remains anonymous and secure.'),
            BulletText('Encourage others in your community to participate.'),
          ],
        ),
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;

  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
