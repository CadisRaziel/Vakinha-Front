import 'package:front_delivery/app/models/product_model.dart';

///Order para pagina de detalhe do produto

class OrderProductDto {
  final ProductModel product;
  final int amout;
  
  OrderProductDto({
    required this.product,
    required this.amout,
  });

  ///Calcular total
  double get totalPrice => amout * (product.price ?? 0.0);
}
