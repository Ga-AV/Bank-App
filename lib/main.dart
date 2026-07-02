import 'package:bank_app/core/enviroment/env.dart';
import 'package:bank_app/core/router/app_router.dart';
import 'package:bank_app/core/utils/local_storage.dart';
import 'package:bank_app/core/utils/locale_notifier.dart';
import 'package:bank_app/features/dashboard/data/datasources/dashboard_local_datasource.dart';
import 'package:bank_app/features/dashboard/data/datasources/dashboard_mock_datasource.dart';
import 'package:bank_app/features/dashboard/data/repositories/%20dashboard_repository_impl.dart';
import 'package:bank_app/features/dashboard/domain/usecases/get_products.dart';
import 'package:bank_app/features/dashboard/presentation/provider/dashboard_provider.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.initialize();
  await LocalStorage().init();
  final localDataSource = DashboardLocalDataSourceImpl(LocalStorage().prefs);
  final mockDataSource = DashboardMockDataSourceImpl();
  final repository = DashboardRepositoryImpl(
    remote: mockDataSource,
    local: localDataSource,
  );

  final getProducts = GetProducts(repository);
  runApp(
    ProviderScope(
      overrides: [
        getProductsProvider.overrideWithValue(GetProducts(repository)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: localeNotifier,
      builder: (context, locale, _) {
        return MaterialApp.router(
          title: 'Bank App',
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            fontFamily: 'OpenSans',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          ),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
