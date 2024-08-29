import 'package:carousel_slider/carousel_slider.dart';
import 'package:favos/src/Entity/shop.dart';
import 'package:favos/src/common/widget/header.dart';
import 'package:favos/src/parts/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 引数の型を定義
typedef ShopListRecord = (int currentIndex, List<Shop> shopList);

class ShopDetailScreen extends StatelessWidget {
  final int currentIndex;
  final List<Shop> shopList;

  ShopDetailScreen({super.key, required ShopListRecord shopListRecord})
      : currentIndex = shopListRecord.$1,
        shopList = shopListRecord.$2;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final String thisMenuLabel = l10n.shop_detail;

    return Scaffold(
      appBar: Header(
        title: thisMenuLabel,
        actions: [
          TextButton(
            child: Text(l10n.done),
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ],
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              enableInfiniteScroll: false,
              initialPage: currentIndex,
              viewportFraction: 0.9),
          items: shopList.map((shop) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              // decoration: const BoxDecoration(color: Colors.amber),
              child: ShopCard(
                shop: shop,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
