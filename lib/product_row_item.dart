import 'package:cupertino_store/model/product.dart';
import 'package:flutter/cupertino.dart';

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
      child: Row(
        children: [],
      ),
    );

    return Column(
      children: [],
    );
  }
}
