import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_datasource.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String email, String password) async {
    try {
      return await remoteDataSource.login(email, password);
    } on UnauthorizedException {
      throw UnauthorizedFailure();
    } on NetworkException {
      throw NetworkFailure();
    } on ServerException {
      throw ServerFailure();
    }
  }
}