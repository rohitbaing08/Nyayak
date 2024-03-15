class CommunityPostModel {
  final String subject;
  final String category;
  final String description;

  CommunityPostModel({
    required this.subject,
    required this.category,
    required this.description,
  });

  factory CommunityPostModel.fromJson(Map<String, dynamic> json) {
    return CommunityPostModel(
      subject: json['subject'],
      category: json['category'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'category': category,
      'description': description,
      // 'isVerified' :false,
    };
  }
}
