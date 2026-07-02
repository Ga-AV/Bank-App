import 'package:bank_app/features/dashboard/domain/usecases/get_products.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';


class DashboardNotifier extends StateNotifier<DashboardState> {
  final GetProducts getProducts;

  DashboardNotifier(this.getProducts)
      : super(const DashboardState());

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final products = await getProducts();

      state = state.copyWith(
        isLoading: false,
        products: products,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}