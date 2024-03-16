import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/icons/brand_title_icon.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/common/widgets/texts/product_price.dart';
import 'package:xstore/common/widgets/texts/product_text_title.dart';
import 'package:xstore/features/shop/controllers/product/product_controller.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/enums.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XProductMetaData extends StatelessWidget {
  const XProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    //final darkMode = XHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            XRoundedContainer(
              radius: XSizes.sm,
              backgroundColor: XColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: XSizes.sm,
                vertical: XSizes.xs,
              ),
              child: Text(
                "-$salePercentage%",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: XColors.black,
                    ),
              ),
            ),
            const SizedBox(
              width: XSizes.spaceBtwItems,
            ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                "\$${product.price}",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(
                width: XSizes.spaceBtwItems,
              ),
            XProductPrice(price: controller.getProductPrice(product)),
          ],
        ),
        const SizedBox(
          height: XSizes.spaceBtwItems / 1.5,
        ),
        XProductTitleText(
          title: product.title,
        ),
        const SizedBox(
          height: XSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const XProductTitleText(title: "Status"),
            const SizedBox(
              width: XSizes.spaceBtwItems,
            ),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(
          height: XSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            XCircularImage(
                width: 40,
                height: 40,
                image: product.brand != null ? product.brand!.image : ''),
            XBrandTitleVerfiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
