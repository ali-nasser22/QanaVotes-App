import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qanavotes_app/models/candidate.dart';
import 'package:qanavotes_app/models/user.dart';

class ApiService {
  static const String baseUrl =
      'https://qanavotes-backend-production.up.railway.app/api';

  static Future<List<Candidate>> fetchCandidates() async {
    final url = Uri.parse('$baseUrl/candidates');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Candidate.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load candidates');
    }
  }

  static Future<void> voteForCandidate({
    required int candidateId,
    required int voteValue,
    required String token,
  }) async {
    final url = Uri.parse('$baseUrl/vote');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({'candidate_id': candidateId, 'vote_value': voteValue}),
    );

    if (response.statusCode != 200) {
      throw Exception('Vote failed: ${response.body}');
    }
  }

  static Future<Map<String, dynamic>> loginUser({
    required String loginId,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode({'login_id': loginId, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return {'token': data['token'], 'user': User.fromJson(data['user'])};
    } else {
      final error = json.decode(response.body);
      throw Exception(error['message'] ?? 'Login failed');
    }
  }
}
