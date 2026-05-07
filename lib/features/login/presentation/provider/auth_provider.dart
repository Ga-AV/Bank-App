import 'package:bank_app/core/network/dio_provider.dart';
import 'package:bank_app/core/utils/secure_storage_service.dart';
import 'package:bank_app/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:bank_app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:bank_app/features/login/domain/usecases/login_usecase.dart';
import 'package:bank_app/features/login/presentation/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final secureStorageProvider =
    Provider((ref) => SecureStorageService());

final authRemoteDatasourceProvider =
    Provider<AuthRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);

  return AuthRemoteDatasourceImpl(dio);
});

final authRepositoryProvider = Provider((ref) {
  final datasource =
      ref.watch(authRemoteDatasourceProvider);

  return AuthRepositoryImpl(datasource);
});

final loginUseCaseProvider = Provider((ref) {
  final repository =
      ref.watch(authRepositoryProvider);

  return LoginUseCase(repository);
});

final authProvider =
    NotifierProvider<AuthNotifier, LoginState>(
        AuthNotifier.new);

class AuthNotifier extends Notifier<LoginState> {
  @override
  LoginState build() {
    return const LoginInitialState();
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      state = const LoginLoadingState();

      final useCase =
          ref.read(loginUseCaseProvider);

      final storage =
          ref.read(secureStorageProvider);

      final user = await useCase(
        username: username,
        password: password,
      );

      await storage.saveToken(user.token);

      state = LoginSuccessState(
        user.firstName,
      );
    } catch (e) {
      state = LoginErrorState(
        e.toString(),
      );
    }
  }

  Future<void> checkSession() async {
    state = const LoginCheckingCacheState();

    final storage =
        ref.read(secureStorageProvider);

    final token = await storage.getToken();

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (token != null) {
      state = const LoginSuccessState(
        'Usuario',
      );
    } else {
      state = const LoginInitialState();
    }
  }

  Future<void> logout() async {
    final storage =
        ref.read(secureStorageProvider);

    await storage.clearToken();

    state = const LoginInitialState();
  }
}