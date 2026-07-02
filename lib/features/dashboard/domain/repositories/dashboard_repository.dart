import 'package:bank_app/features/dashboard/domain/entities/product.dart';

abstract class DashboardRepository {

  Future<List<Product>> getProducts();

}