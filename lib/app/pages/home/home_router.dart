import 'package:flutter/material.dart';
import 'package:front_delivery/app/pages/home/home_controller.dart';
import 'package:front_delivery/app/pages/home/home_page.dart';
import 'package:front_delivery/app/repositories/products/products_repository.dart';
import 'package:front_delivery/app/repositories/products/products_repository_impl.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  ///Toda injeção de dependencia que terá na homePage eu colocaquei aqui, e la no appWidget eu chamo essa classe
  ///Se não eu iria ter que colocar tudo que esta aqui la no appWidget

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(
              ///context.read(), Como ja temos no ApplicationBind a classe do CustomDio, nos pegamos ela com o 'read'
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => HomeController(
              context.read(),
            ),
          )
        ],
        child: const HomePage(),
      );
}
