import 'package:bank_app/features/dashboard/domain/entities/product.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(false) bool isLoading,
    @Default([]) List<Product> products,
    String? error,
  }) = _DashboardState;
}