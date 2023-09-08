import 'package:flutter/material.dart';
import 'package:front_delivery/app/core/ui/styles/colors_app.dart';
import 'package:front_delivery/app/core/ui/styles/text_styles.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final int amout;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;

  const DeliveryIncrementDecrementButton(
      {super.key, required this.amout, this.onDecrement, this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
          onTap: onDecrement,
                  child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "-",
              style: context.textStyles.textMedium
                  .copyWith(fontSize: 22, color: Colors.grey),
            ),
          ),
        ),
        Text(
          amout.toString(),
          style: context.textStyles.textRegular.copyWith(
            fontSize: 17,
            color: context.colors.secondary,
          ),
        ),
        InkWell(
          onTap: onIncrement,
                  child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "+",
              style: context.textStyles.textMedium
                  .copyWith(fontSize: 22, color: context.colors.secondary),
            ),
          ),
        ),
      ]),
    );
  }
}
