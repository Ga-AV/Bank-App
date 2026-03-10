import 'package:bank_app/core/network/dio_client.dart';
import 'package:bank_app/features/login/data/datasources/login_remote_datasource.dart';
import 'package:bank_app/features/login/data/repositories/login_repository_impl.dart';
import 'package:bank_app/features/login/domain/usecases/login_usecase.dart';
import 'package:bank_app/features/login/presentation/provider/login_provider.dart';
import 'package:bank_app/features/login/presentation/views/login_view.dart';
import 'package:bank_app/features/login/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final dioClient = DioClient();
  final remoteDataSource = LoginRemoteDataSourceImpl(dioClient.dio);
  final repository = LoginRepositoryImpl(remoteDataSource);
  final loginUseCase = LoginUseCase(repository);

  //runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider(loginUseCase)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const WelcomeView(),
    );
  }
}
