import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../locale/localization.dart';
import '../../../models/product_model.dart';
import '../../Product-Details/product_details.dart';

class FurnitureGridItem extends StatelessWidget {
  final ProductModel productModel;

  const FurnitureGridItem({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProductDetailScreen(productModel)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Container(
          // height: MediaQuery.of(context).size.height * .3,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset.zero,
                blurRadius: 15.0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // alignment: Alignment.bottomCenter,
                    image: NetworkImage(productModel.productImg!),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        productModel.productName!,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 20,
                            ),
                      ),
                      Text(
                        '${productModel.price} ' +
                            "${AppLocalizations.of(context)!.le}",
                        style: TextStyle(
                          fontSize: 20,
                          color: theme,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        '${productModel.oldPrice}' +
                            "${AppLocalizations.of(context)!.le}",
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black38,
                        ),
                      ),
                      // Wrap(
                      //   spacing: 0,
                      //   crossAxisAlignment: WrapCrossAlignment.start,
                      //   direction: Axis.vertical,
                      //   children: [
                      // Text(
                      //   '${productModel.price} ' +
                      //       "${AppLocalizations.of(context)!.le}",
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     color: theme,
                      //     height: 1.5,
                      //   ),
                      // ),
                      // Text(
                      //   '${productModel.oldPrice}' +
                      //       "${AppLocalizations.of(context)!.le}",
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     height: 1.5,
                      //     decoration: TextDecoration.lineThrough,
                      //     color: Colors.black38,
                      //   ),
                      // ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
