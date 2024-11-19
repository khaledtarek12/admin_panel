import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/loading/skeltionizer.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class TBoxesShammer extends StatelessWidget {
  const TBoxesShammer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShammerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShammerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShammerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
