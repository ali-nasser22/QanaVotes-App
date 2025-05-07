import 'package:flutter/material.dart';
import 'package:qanavotes_app/core/api_service.dart';
import 'package:qanavotes_app/core/widgets/main_scaffold.dart';
import 'package:qanavotes_app/models/candidate.dart';
import 'package:qanavotes_app/models/user.dart';
import 'package:qanavotes_app/screens/candidates/candidate_detail_screen.dart';

class CandidatesListScreen extends StatefulWidget {
  final User user;
  final String token;

  const CandidatesListScreen({
    super.key,
    required this.user,
    required this.token,
  });

  @override
  State<CandidatesListScreen> createState() => _CandidatesListScreenState();
}

class _CandidatesListScreenState extends State<CandidatesListScreen> {
  List<Candidate> candidates = [];
  List<Candidate> filtered = [];
  bool isLoading = true;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final result = await ApiService.fetchCandidates();
      setState(() {
        candidates = result;
        filtered = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load candidates: $e')));
    }
  }

  void filter(String query) {
    setState(() {
      filtered =
          candidates
              .where((c) => c.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Candidates',
      child:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: TextField(
                      controller: searchController,
                      onChanged: filter,
                      decoration: InputDecoration(
                        hintText: 'Search candidates...',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final candidate = filtered[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                candidate.photo,
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.person);
                                },
                              ),
                            ),
                            title: Text(
                              candidate.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => CandidateDetailScreen(
                                        id: candidate.id,
                                        name: candidate.name,
                                        photoUrl: candidate.photo,
                                        description: candidate.description,
                                        token: widget.token,
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
