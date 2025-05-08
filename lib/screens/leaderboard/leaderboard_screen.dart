import 'package:flutter/material.dart';
import 'package:qanavotes_app/core/api_service.dart';
import 'package:qanavotes_app/core/widgets/main_scaffold.dart';
import 'package:qanavotes_app/models/user.dart';

class LeaderboardScreen extends StatefulWidget {
  final User user;
  final String token;

  const LeaderboardScreen({required this.user, required this.token, super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  bool isLoading = true;
  List<Map<String, dynamic>> leaderboardData = [];

  @override
  void initState() {
    super.initState();
    loadLeaderboard();
  }

  void loadLeaderboard() async {
    try {
      final data = await ApiService.fetchLeaderboard();
      setState(() {
        leaderboardData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load leaderboard: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Leaderboard',
      user: widget.user,
      token: widget.token,
      child:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
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
                        radius: 26,
                        backgroundImage:
                            candidate['photo'] != null
                                ? NetworkImage(candidate['photo'])
                                : null,
                        backgroundColor: Colors.indigo,
                        child:
                            candidate['photo'] == null
                                ? const Icon(
                                  Icons.person,
                                  size: 26,
                                  color: Colors.white,
                                )
                                : null, // optional: fallback background
                      ),
                      title: Text(
                        candidate['full_name'] ?? 'Unknown',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'Score: ${candidate['score'] ?? 0}',
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
