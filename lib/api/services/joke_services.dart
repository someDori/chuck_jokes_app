import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();

  Future<String> randomJoke() async {
    final response = await dio.get('https://api.chucknorris.io/jokes/random');
    print(response);
    return response.data['value'] as String;
  }

  Future<String> categoryJoke(String category) async {
    final response = await dio.get(
      'https://api.chucknorris.io/jokes/random',
      queryParameters: {'category': category},
    );
    print(response);
    return response.data['value'] as String;
  }

  Future<Response> categories() async {
    final response =
        await dio.get('https://api.chucknorris.io/jokes/categories');
    return response;
  }
}
