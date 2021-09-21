import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kppani_furniture/locale/localization.dart';
import 'package:kppani_furniture/models/product_model.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../constant.dart';
import '../../pages/Products/widgets/header_sliver.dart';

class ProductsScreen extends StatefulWidget {
  final String? title;
  final int? catgoryID;
  final int? subCatgoryID;

  ProductsScreen(this.title, this.catgoryID, this.subCatgoryID);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> productList = [];
  bool _isListening = true;
  stt.SpeechToText? _speechToText;
  TextEditingController _controller = TextEditingController();

  getProducts() async {
    productList.clear();
    Uri uri = Uri.parse("$baseUrl/products?access_token=$accessToken");
    http.Response response = await http.get(
      uri,
      headers: {"Accept": "application/json"},
    );
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["Products"];
      for (var i in data) {
        if (widget.catgoryID == int.parse(i["category_id"]) &&
            widget.subCatgoryID == null) {
          ProductModel productModel = ProductModel(
            id: i["id"],
            productName: i["product_name"],
            productNameAr: i["name_ar"],
            productDes: i["description"],
            productDesAr: i["description_ar"],
            productImg: i["photo"],
            allTags: i["allTags"],
            active: i["active"],
            deliveryFree: i["deliv_free"],
            deliveryTime: i["deliv_time"],
            quantInStore: int.parse(i["quant"]),
            deals: i["deals"],
            dealsPrice: i["deals_price"],
            price: i["price"],
            oldPrice: i["compare_price"],
            warranty: i["warranty"],
            warrantyAr: i["warranty_ar"],
            varientTitle: i["varient_title"],
            varientList: i["varient_list"],
          );
          setState(() {
            productList.add(productModel);
          });
        } else if (widget.subCatgoryID == int.parse(i["sub_category_id"]) &&
            widget.catgoryID == null) {
          ProductModel productModel = ProductModel(
            id: i["id"],
            productName: i["product_name"],
            productNameAr: i["name_ar"],
            productDes: i["description"],
            productDesAr: i["description_ar"],
            productImg: i["photo"],
            allTags: i["allTags"],
            active: i["active"],
            deliveryFree: i["deliv_free"],
            deliveryTime: i["deliv_time"],
            quantInStore: int.parse(i["quant"]),
            deals: i["deals"],
            dealsPrice: i["deals_price"],
            price: i["price"],
            oldPrice: i["compare_price"],
            warranty: i["warranty"],
            warrantyAr: i["warranty_ar"],
            varientTitle: i["varient_title"],
            varientList: i["varient_list"],
          );
          setState(() {
            productList.add(productModel);
          });
        }
      }
    }
  }

  _listen() async {
    if (!_isListening) {
      bool available = await _speechToText!.initialize(
        onStatus: (val) => print('status is $val'),
        onError: (val) => print('error is $val'),
      );
      if (available) {
        setState(() {
          _isListening = true;
        });
        _speechToText!.listen(
            onResult: (val) => setState(() {
                  _controller.text = val.recognizedWords;
                }));
      }
    } else {
      setState(() {
        _isListening = false;
      });
      _speechToText!.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    getProducts();
    _speechToText = stt.SpeechToText();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: HeaderSliver(
              minExtent: 120,
              maxExtent: 120,
              title: widget.title,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width -
                        MediaQuery.of(context).padding.horizontal) *
                    0.03,
                vertical: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.vertical) *
                    0.02,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: CupertinoSearchTextField(
                  placeholder: "  Search Now",
                  controller: _controller,
                  // suffixIcon: Icon(
                  //   Icons.search,
                  // ),
                  prefixIcon: IconButton(
                    onPressed: _listen,
                    icon: Icon(
                        _isListening ? CupertinoIcons.mic : Icons.mic_none),
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            // SizedBox
            Container(
              height: 10,
              color: Colors.grey.shade100,
            ),
            Container(
              color: Colors.grey.shade100,
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: 15,
                spacing: 7,
                alignment: WrapAlignment.center,
                children: productList.map<Widget>((f) {
                  return Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * .47,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .3,
                          // constraints: BoxConstraints(
                          //   minWidth: MediaQuery.of(context).size.width * .45,
                          // ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(f.productImg!),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                f.productName!,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 20,
                                    ),
                              ),
                              Text(
                                '${f.price} ' +
                                    "${AppLocalizations.of(context)!.le}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: theme,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                '${f.oldPrice}' +
                                    "${AppLocalizations.of(context)!.le}",
                                style: TextStyle(
                                  fontSize: 18,
                                  height: 1.5,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ])),
          // SliverGrid.count(
          //   crossAxisCount: 2,
          //   childAspectRatio: .51,
          //   mainAxisSpacing: 15,
          //   crossAxisSpacing: 2,
          //   children: productList.map<Widget>((f) {
          //     return FurnitureGridItem(
          //       productModel: f,
          //     );
          //   }).toList(),
          // ),
        ],
      ),
    );
  }
}
