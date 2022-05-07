import 'package:dio/dio.dart';

class ProjectDioMixin{
  final service = Dio(BaseOptions(
    baseUrl: "https://api.collectapi.com/news",
    headers: {
      "authorization" : "apikey 7KiNDBMZbS3PlCxjsP76gD:41PssrgapfB5SRwt9rbAOe",
      "content-type" : "application/json"
    }
  ));
}