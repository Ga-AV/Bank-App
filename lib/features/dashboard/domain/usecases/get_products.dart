import 'package:bank_app/features/dashboard/domain/entities/product.dart';
import 'package:bank_app/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetProducts {

  final DashboardRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }

}