import 'package:dio/dio.dart';

class SocialProfileRepository {
  final Dio _dio = Dio();

  //Future<List<SocialProfile>> fetchUsers() async {
  Future<List<dynamic>> fetchUsers() async {
    final response =
        await _dio.get('https://dummyapi.online/api/social-profiles');
    return response.data;
    //final List<dynamic> data = response.data;
    //print('data : $data');
    //return data.map((json) => SocialProfile.fromJson(json)).toList();
  }
}
