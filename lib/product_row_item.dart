import 'package:cupertino_store/model/app_state_model.dart';
import 'package:cupertino_store/model/product.dart';
import 'package:cupertino_store/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductRowItem extends StatelessWidget {
  const ProductRowItem({
    this.index,
    this.product,
    this.lastItem,
  });

  final Product product;
  final int index;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
      child: Row(
        children: [
          ClipRect(
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.cover,
              width: 76,
              height: 76,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Styles.productRowItemName,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                  ),
                  Text(
                    '\$${product.price}',
                    style: Styles.productRowItemPrice,
                  )
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.plus_circled,
              semanticLabel: 'Add',
            ),
            onPressed: () {
              final model = Provider.of<AppStateModel>(context, listen: false);
              model.addProductToCart(product.id);
            },
          ),
        ],
      ),
    );

    if (lastItem) {
      return row;
    }

    return Column(
      children: [
        row,
        Padding(
          padding: EdgeInsets.only(left: 100, right: 16),
          child: Container(
            height: 1,
            color: Styles.productRowDivider,
          ),
        )
      ],
    );
  }
}
