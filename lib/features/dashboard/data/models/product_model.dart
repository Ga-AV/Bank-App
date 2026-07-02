import 'package:bank_app/features/dashboard/domain/entities/product.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required String id,
    required String accountNumber,
    required String productName,
    required double balance,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Product toEntity() {
    return Product(
      id: id,
      accountNumber: accountNumber,
      productName: productName,
      balance: balance,
    );
  }
}
