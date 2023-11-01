import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://burgers-hub.p.rapidapi.com/',
          receiveDataWhenStatusError: true,
        headers: {
          'X-RapidAPI-Key': '6e1dd69cd7msh6309312b9e57906p18d24djsn8caed6dd36c9',
          'X-RapidAPI-Host': 'burgers-hub.p.rapidapi.com'
        }
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async
  {
    dio.options.headers =
    {
      'X-RapidAPI-Key': '6e1dd69cd7msh6309312b9e57906p18d24djsn8caed6dd36c9',
      'X-RapidAPI-Host': 'burgers-hub.p.rapidapi.com'
    };

    return await dio.get(
      url,
    );
  }



}
