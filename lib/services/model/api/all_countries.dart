import 'package:dio/dio.dart';

class AllCountriesRepository {
  final Dio _dio = Dio();

  //Future<List<SocialProfile>> fetchUsers() async {
  Future<dynamic> fetchUsers() async {
    final response = await _dio.get(
        'https://api.countrystatecity.in/v1/countries',
        options: Options(headers: {
          "X-CSCAPI-KEY":
              "NFlmbVBYVWhvcXFRc3lkblAwSTE5OTlpV0dxenNIeTkzdWdZSTF4Wg=="
        }));

    if (response.statusCode == 200) {
      print('Response : $response');
      return response.data;
    } else {
      print('error');
    }
  }
}
