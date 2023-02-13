// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:front_delivery/app/core/exceptions/repository_exception.dart';
import 'package:front_delivery/app/core/rest_client/custom_dio.dart';
import 'package:front_delivery/app/models/product_model.dart';
import 'package:front_delivery/app/repositories/products/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;
  ProductsRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unAuth().get("/products");
      return result.data
          .map<ProductModel>((product) => ProductModel.fromMap(product))
          .toList();
    } on DioError catch (e, s) {
      log("Error ao buscar produtos", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar produtos");
    }
  }
}
