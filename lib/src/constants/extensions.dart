import 'package:dio/dio.dart';
import 'package:find_the_authors/src/constants/constants.dart'
    show APIEndPoints;

extension BaseURLExtension on Dio {
  Dio get toBaseURL => Dio(BaseOptions(baseUrl: APIEndPoints.kBaseUrl));
}
