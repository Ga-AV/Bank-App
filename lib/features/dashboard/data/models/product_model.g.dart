// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String,
      accountNumber: json['accountNumber'] as String,
      productName: json['productName'] as String,
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountNumber': instance.accountNumber,
      'productName': instance.productName,
      'balance': instance.balance,
    };
