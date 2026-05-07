abstract base class LoginState {
  final String title;
  final bool logged;

  const LoginState({
    required this.title,
    required this.logged,
  });
}

final class LoginInitialState extends LoginState {
  const LoginInitialState()
      : super(
          title: 'Login',
          logged: false,
        );
}

final class LoginLoadingState extends LoginState {
  const LoginLoadingState()
      : super(
          title: 'Haciendo login...',
          logged: false,
        );
}

final class LoginCheckingCacheState
    extends LoginState {
  const LoginCheckingCacheState()
      : super(
          title: 'Verificando sesión...',
          logged: false,
        );
}

final class LoginSuccessState extends LoginState {
  final String userName;

  const LoginSuccessState(this.userName)
      : super(
          title: 'Bienvenido $userName',
          logged: true,
        );
}

final class LoginErrorState extends LoginState {
  final String errorMessage;

  const LoginErrorState(this.errorMessage)
      : super(
          title: 'Error al hacer login',
          logged: false,
        );
}