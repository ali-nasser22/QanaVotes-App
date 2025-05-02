import 'package:flutter/material.dart';
import 'package:qanavotes_app/core/widgets/main_scaffold.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leaderboardData = [
      {
        'name': 'Ali Mansour',
        'photo': 'https://via.placeholder.com/100',
        'score': 41,
      },
      {
        'name': 'Fatima Youssef',
        'photo': 'https://via.placeholder.com/100',
        'score': 37,
      },
      {
        'name': 'Hassan Khalil',
        'photo': 'https://via.placeholder.com/100',
        'score': 22,
      },
    ];

    return MainScaffold(
      title: 'Leaderboard',
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: leaderboardData.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final candidate = leaderboardData[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(candidate['photo']),
                radius: 26,
              ),
              title: Text(
                candidate['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                'Score: ${candidate['score']}',
                style: const TextStyle(fontSize: 14),
              ),
              trailing: Text(
                '#${index + 1}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.indigo[600],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
