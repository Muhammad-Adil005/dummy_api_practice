import 'package:dio/dio.dart';

class BlogPostRepository {
  final Dio _dio = Dio();

  //Future<List<SocialProfile>> fetchUsers() async {
  Future<List<dynamic>> fetchUsers() async {
    final response = await _dio.get('https://dummyapi.online/api/blogposts');
    return response.data;
  }
}
