import 'package:bank_app/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:bank_app/features/login/data/repositories/auth_repository.dart';
import 'package:bank_app/features/login/domain/entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<UserEntity> login({
    required String username,
    required String password,
  }) async {
    return await datasource.login(
      username: username,
      password: password,
    );
  }
}