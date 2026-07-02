import 'package:bank_app/features/dashboard/domain/usecases/get_products.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_notifier.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final getProductsProvider = Provider<GetProducts>((ref) {
  throw UnimplementedError();
});

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
  (ref) {
    final useCase = ref.watch(getProductsProvider);
    return DashboardNotifier(useCase);
  },
);

