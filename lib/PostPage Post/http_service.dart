import 'dart:convert';
import 'package:http/http.dart' as http;
import '../post/post_model.dart'; // Pastikan path model Post sudah benar

class HttpService {
  final String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
