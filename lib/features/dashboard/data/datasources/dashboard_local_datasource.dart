import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

abstract class DashboardLocalDataSource {
  Future<void> cacheProducts(List<ProductModel> products);

  Future<List<ProductModel>> getCachedProducts();
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  static const _productsKey = 'dashboard_products';

  final SharedPreferences preferences;
  DashboardLocalDataSourceImpl(this.preferences);

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final jsonList = products.map((e) => e.toJson()).toList();
    await preferences.setString(_productsKey, jsonEncode(jsonList));
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    final jsonString = preferences.getString(_productsKey);

    if (jsonString == null) {
      return [];
    }

    final List decoded = jsonDecode(jsonString);

    return decoded.map((e) => ProductModel.fromJson(e)).toList();
  }
}
