import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginProvider(this.loginUseCase);

  bool isLoading = false;
  String? error;
  User? user;

  Future<void> login(String email, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      user = await loginUseCase(email, password);
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}