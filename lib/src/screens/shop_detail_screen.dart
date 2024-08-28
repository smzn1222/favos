import 'package:carousel_slider/carousel_slider.dart';
import 'package:favos/src/common/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopDetailScreen extends StatelessWidget {
  const ShopDetailScreen({super.key});

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
            initialPage: 3,
          ),
          items: [1, 2, 3].map((i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(color: Colors.amber),
              child: Text('text $i', style: const TextStyle(fontSize: 16.0)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
