import 'package:flutter/material.dart';
import 'package:front_delivery/app/pages/product_detail/product_detail_controller.dart';
import 'package:front_delivery/app/pages/product_detail/product_detail_page.dart';
import 'package:provider/provider.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  ///Toda injeção de dependencia que terá na homePage eu colocaquei aqui, e la no appWidget eu chamo essa classe
  ///Se não eu iria ter que colocar tudo que esta aqui la no appWidget

  static Widget get page => MultiProvider(
        providers: [        
          Provider(
            create: (context) => ProductDetailController()
          )
        ],

          builder: (context, child) {
            final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
            return ProductDetailPage(product: args['product'],);
          },

        ///Quando temos uma logica(igual do ProductDetailController) envolvida nós não utilizamos mais o child (e passaremos argumentos)
        // child: ProductDetailPage(),
      );
}
