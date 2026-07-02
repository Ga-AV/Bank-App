import 'package:bank_app/features/dashboard/data/datasources/dashboard_local_datasource.dart';
import 'package:bank_app/features/dashboard/data/datasources/dashboard_mock_datasource.dart';
import 'package:bank_app/features/dashboard/domain/entities/product.dart';
import 'package:bank_app/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardMockDataSource remote;
  final DashboardLocalDataSource local;

  DashboardRepositoryImpl({required this.remote, required this.local});

  @override
  Future<List<Product>> getProducts() async {
    try {
      final models = await remote.getProducts();
      await local.cacheProducts(models);
      return models.map((model) => model.toEntity()).toList();
    } catch (_) {
      final cached = await local.getCachedProducts();
      return cached.map((model) => model.toEntity()).toList();
    }
  }
}
