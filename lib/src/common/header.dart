import 'package:flutter/material.dart';

// mada: アイコンとメソッドもパラメータにする・データ構造にする・設定ファイルから読み取るようにする（footerも）
class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // leadingがnullの場合に戻るボタンを表示しないようにする
      centerTitle: true,
      title: SizedBox(
          // height: double.infinity,
          child: FittedBox(fit: BoxFit.fitHeight, child: Text(title))),
      leading: leading,
      actions: actions,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
