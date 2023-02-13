import 'package:flutter/material.dart';
import 'package:front_delivery/app/pages/home/home_controller.dart';
import 'package:front_delivery/app/pages/home/home_page.dart';
import 'package:front_delivery/app/repositories/products/products_repository.dart';
import 'package:front_delivery/app/repositories/products/products_repository_impl.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(
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
