import 'package:front_delivery/app/models/product_model.dart';


///Interface do repositorie, realizo metodos de contrato

abstract class ProductsRepository {
  //o modelo não é uma lista, é um objeto, mais aqui no get eu falo que é uma lista
  Future<List<ProductModel>> findAllProducts();
}
