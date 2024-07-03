import 'package:dio/dio.dart';

class AllCountriesRepository {
  final Dio _dio = Dio();

  // Fetch countries
  // Future<dynamic> fetchCountries() async {
  Future<List<dynamic>> fetchCountries() async {
    try {
      final response = await _dio.get(
          'https://api.countrystatecity.in/v1/countries',
          options: Options(headers: {
            "X-CSCAPI-KEY":
                "NFlmbVBYVWhvcXFRc3lkblAwSTE5OTlpV0dxenNIeTkzdWdZSTF4Wg=="
          }));

      if (response.statusCode == 200) {
        // print('Response : $response');
        return response.data;
      } else {
        throw Exception('Failed to fetch countries');
      }
    } catch (e) {
      print('Error : $e');
      rethrow;
    }
  }

  // Fetch states for a specific country
  // Future<dynamic> fetchStates(String iso2) async {
  // Future<List<StateModel>> fetchStates(String iso2) async {
  Future<List<dynamic>> fetchStates(String iso2) async {
    try {
      final urlstate =
          'https://api.countrystatecity.in/v1/countries/$iso2/states';
      print('URL State : $urlstate');
      // print('Fetching states for country: $iso2');
      final response = await _dio.get(
          //  'https://api.countrystatecity.in/v1/countries/$iso2/states',
          urlstate,
          options: Options(headers: {
            "X-CSCAPI-KEY":
                "NFlmbVBYVWhvcXFRc3lkblAwSTE5OTlpV0dxenNIeTkzdWdZSTF4Wg=="
          }));

      if (response.statusCode == 200) {
        print('Resonse body: ${response.statusCode}');
        print('Response : $response');
        return response.data;
      } else {
        throw Exception('Failed to fetch states');
      }
    } catch (e) {
      print('Error : $e');
      rethrow;
    }
  }

  //Future<List<StateDetailsModel>> fetchStateDetails(
  Future<List<dynamic>> fetchStateDetails(String iso2, String province) async {
    try {
      print('iso2: $iso2, province: $province');

      final urlState =
          'https://api.countrystatecity.in/v1/countries/$iso2/states/$province/cities';
      print('URL State : $urlState');
      final response = await _dio.get(urlState,
          options: Options(headers: {
            "X-CSCAPI-KEY":
                "NFlmbVBYVWhvcXFRc3lkblAwSTE5OTlpV0dxenNIeTkzdWdZSTF4Wg=="
          }));

      if (response.statusCode == 200) {
        print('Response : $response');
        return response.data;
      } else {
        print(
            'Error: Status code ${response.statusCode}, ${response.statusMessage}');
        throw Exception('Failed to fetch states');
      }
    } catch (e) {
      print('Error : $e');
      rethrow;
    }
  }
}
