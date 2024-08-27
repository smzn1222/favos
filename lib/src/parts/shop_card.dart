import 'package:favos/src/Entity/shop.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ShopCard extends StatelessWidget {
  final Shop shop;

  ShopCard({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => GoRouter.of(context).go('/shop_list/detail'),
        child: ListTile(
          title: Text(shop.name),
          subtitle: Text(shop.url),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showCustomModalBottomSheet(
                context: context,
                builder: (context) => ModalFit(),
                containerWidget: (_, __, child) => FloatingModal(
                      child: child,
                    ),
                expand: false),
          ),
        ),
      ),
    );
  }
}

// todo: あとで削除
class ModalFit extends StatelessWidget {
  const ModalFit({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Edit'),
            leading: Icon(Icons.edit),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Copy'),
            leading: Icon(Icons.content_copy),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Cut'),
            leading: Icon(Icons.content_cut),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Move'),
            leading: Icon(Icons.folder_open),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Delete'),
            leading: Icon(Icons.delete),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    ));
  }
}

// todo: あとで削除
class FloatingModal extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const FloatingModal({super.key, required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}
