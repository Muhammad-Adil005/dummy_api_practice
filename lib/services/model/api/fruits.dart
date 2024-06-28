import 'package:dio/dio.dart';

class FruitsRepository {
  final Dio _dio = Dio();

  //Future<List<SocialProfile>> fetchUsers() async {
  Future<List<dynamic>> fetchUsers() async {
    final response = await _dio.get('https://fruityvice.com/api/fruit/all');
    print('Response : $response');
    return response.data;
  }
}
