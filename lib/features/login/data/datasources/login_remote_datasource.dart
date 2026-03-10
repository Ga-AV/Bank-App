import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      if (email == "test" && password == "1234") {
        return UserModel(id: "1", email: email);
      } else {
        throw UnauthorizedException();
      }

      // final response = await dio.post(
      //   "/login",
      //   data: {
      //     "email": email,
      //     "password": password,
      //   },
      // );
      // return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw NetworkException();
      } else if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw ServerException();
      }
    }
  }
}
