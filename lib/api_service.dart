import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;
  final String email;
  final String profilePicture;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: "${json['first_name']} ${json['last_name']}", // combine first + last
      email: json['email'],
      profilePicture: json['avatar'], // use avatar URL directly
    );
  }
}

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users?page=1'));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List<dynamic> jsonList = decoded['data']; // extract data list
        return jsonList.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }
}
