import 'package:dio/dio.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login({
    required String username,
    required String password,
  });
}

class AuthRemoteDatasourceImpl
    implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      '/auth/login',
      data: {
        "username": username,
        "password": password,
      },
    );

    return UserModel.fromJson(response.data);
  }
}