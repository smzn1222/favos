import 'package:favos/src/common/interface/main_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Footer extends StatelessWidget {
  Footer({
    super.key,
    required this.currentMenuLabel,
    required this.mainMenuInfo,
  });

  late final MainMenuInfo mainMenuInfo;

  final String currentMenuLabel;

  @override
  Widget build(BuildContext context) {
    final int currentMenuIndex = mainMenuInfo.menuItems
        .indexWhere((element) => element.label == currentMenuLabel);

    return BottomNavigationBar(
      items: List.generate(mainMenuInfo.menuItems.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(mainMenuInfo.menuItems[index].icon),
          label: mainMenuInfo.menuItems[index].label,
        );
      }),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentMenuIndex,
      onTap: (index) {
        GoRouter.of(context).go(mainMenuInfo.menuItems[index].route);
      },
      selectedItemColor: Theme.of(context).colorScheme.onBackground,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      enableFeedback: false,
      // currentIndex: 1,
      // // アイコンサイズ
      // iconSize: 35,
      // // アイコンの色設定をここで行う（統一する）
      // selectedIconTheme:
      //     const IconThemeData(color: ・・・),
      // unselectedIconTheme:
      //     const IconThemeData(color: ・・・),
      // // ラベルの色設定をここで行う（統一する）
      // selectedItemColor: ・・・,
      // unselectedItemColor: ・・・,
      // // ラベルのTextstyle設定（fontSizeを統一させる）
      // selectedLabelStyle: TextStyle(fontSize: ・・・),
      // unselectedLabelStyle: TextStyle(fontSize: ・・・),
      // // 背景色
      // backgroundColor: CommonColors.primaryColor,
      // items: const [
      // 　　　　BottomNavigationBarItem(label: "レシピ追加", icon: Icon(Icons.add)),
      //   BottomNavigationBarItem(label: "ホーム画面更新", icon: Icon(Icons.home)),
      //   BottomNavigationBarItem(label: "設定", icon: Icon(Icons.settings)),
      // ],
      // // タップされたボタンに応じて，画面遷移する．
      // onTap: (index) {
      //         ・・・・・
      // },
    );
  }
}
