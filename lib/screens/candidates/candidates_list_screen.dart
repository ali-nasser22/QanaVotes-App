import 'package:flutter/material.dart';
import 'package:qanavotes_app/core/widgets/main_scaffold.dart';

import 'candidate_detail_screen.dart';

class CandidatesListScreen extends StatefulWidget {
  const CandidatesListScreen({super.key});

  @override
  State<CandidatesListScreen> createState() => _CandidatesListScreenState();
}

class _CandidatesListScreenState extends State<CandidatesListScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> candidates = [
    {
      'name': 'Ali Mansour',
      'photo': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Fatima Youssef',
      'photo': 'https://via.placeholder.com/150',
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCandidates = candidates
        .where((c) => c['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return MainScaffold(
      title: 'Candidates',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: TextField(
              controller: searchController,
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Search candidates...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCandidates.length,
              itemBuilder: (context, index) {
                final candidate = filteredCandidates[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(candidate['photo']!, width: 48, height: 48, fit: BoxFit.cover),
                    ),
                    title: Text(
                      candidate['name']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CandidateDetailScreen(
                            name: candidate['name']!,
                            photoUrl: candidate['photo']!,
                            description: 'This candidate is passionate about community development in Qana.', // Placeholder
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
