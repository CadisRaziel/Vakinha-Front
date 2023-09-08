import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_delivery/app/core/extensions/formatter_extension.dart';
import 'package:front_delivery/app/core/ui/base_state/base_state.dart';
import 'package:front_delivery/app/core/ui/helpers/size_extensions.dart';
import 'package:front_delivery/app/core/ui/styles/text_styles.dart';
import 'package:front_delivery/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:front_delivery/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:front_delivery/app/models/product_model.dart';
import 'package:front_delivery/app/pages/product_detail/product_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void onReady() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.image ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.name ?? '',
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description ?? '',
                  style: context.textStyles.textLight.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                  width: context.percentWidth(.5),
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return DeliveryIncrementDecrementButton(
                        amout: amount,
                        onIncrement: () {
                          controller.increment();
                        },
                        onDecrement: () {
                          controller.decrement();
                        },
                      );
                    },
                  )),
              Container(
                  width: context.percentWidth(.5),
                  padding: const EdgeInsets.all(8),
                  height: 68,

                  ///Poderiamos usar um blocSelector, porem temos só um estado que é o int
                  ///ProductDetailController(controller da onde vem o metodo), int(nosso estado)
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Adicionar",
                                style: context.textStyles.textExtraBold
                                    .copyWith(fontSize: 13)),
                            const SizedBox(
                              width: 10,
                            ),

                            ///AutoSizeText a gente implementa direto no widget e não no app_widget como de costume(ele é responsivo)
                            ///Quando implementarmos o autoSizeText e ele não funciona é necessario envolver em um expanded
                            Expanded(
                              child: AutoSizeText(
                                maxFontSize: 13,
                                minFontSize: 5,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                ((widget.product.price ?? 0) * amount)
                                    .currencyPTBR,
                                style: context.textStyles.textExtraBold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ))
            ],
          )
        ],
      ),
    );
  }
}
