import 'package:flutter/material.dart';
import 'package:front_delivery/app/core/provider/application_binding.dart';
import 'package:front_delivery/app/core/ui/theme/theme_config.dart';
import 'package:front_delivery/app/pages/home/home_router.dart';
import 'package:front_delivery/app/pages/product_detail/product_detail_router.dart';
import 'package:front_delivery/app/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery',
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),

          ///HomeRouter.page, pois dentro dessa classe tem implementações de provider(multiprovider)
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
        },
      ),
    );
  }
}
