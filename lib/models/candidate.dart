class Candidate {
  final int id;
  final String name;
  final String photo;
  final String description;

  Candidate({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json['id'] ?? 0,
      name: json['full_name']?.toString() ?? 'Unnamed',
      photo: json['photo']?.toString() ?? 'https://placehold.co/150x150',
      description: json['bio']?.toString() ?? 'No description provided',
    );
  }
}
