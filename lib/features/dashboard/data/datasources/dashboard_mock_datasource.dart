import 'package:bank_app/features/dashboard/data/models/product_model.dart';

abstract class DashboardMockDataSource {
  Future<List<ProductModel>> getProducts();
}

class DashboardMockDataSourceImpl
    implements DashboardMockDataSource {

  @override
  Future<List<ProductModel>> getProducts() async {

    await Future.delayed(Duration(seconds: 2));

    return [
      ProductModel(
        id: "1",
        accountNumber: "2858",
        productName: "Savings",
        balance: 8000,
      ),

      ProductModel(
        id: "2",
        accountNumber: "9832",
        productName: "Checking",
        balance: 2500,
      ),

    ];
  }
}