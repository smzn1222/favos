import 'package:favos/src/common/page/custom_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouterのpageBuilderに渡す関数
// 直接GoRouterのpageBuilderにPageを渡しても良い

// 通常のアニメーションの画面遷移
MaterialPage<void> normalAnimation(Widget screen) {
  return MaterialPage<void>(
    child: screen,
    fullscreenDialog: false,
  );
}

// 基本はnomalAnimationと同様だが、iOSのみモーダル遷移（下からスライドイン）するようなアニメーションの画面遷移
MaterialPage<void> fullScreenDialogAnimation(Widget screen) {
  return MaterialPage<void>(
    child: screen,
    fullscreenDialog: true,
  );
}

// iOSライクな右からのスライドアニメーションをする画面遷移
CupertinoPage<void> cupertinoRightSlideAnimation(Widget screen) {
  return CupertinoPage<void>(
    child: screen,
    fullscreenDialog: false,
  );
}

// iOSライクな下からのスライドアニメーションをする画面遷移
CupertinoPage<void> cupertinoUpperSlideAnimation(Widget screen) {
  return CupertinoPage<void>(
    child: screen,
    fullscreenDialog: true,
  );
}

// アニメーションなしの画面遷移
CustomTransitionPage<void> withoutAnimation(Widget screen) {
  return NoTransitionPage<void>(
    child: screen,
  );
}

// 右からスライドインするようなアニメーションの画面遷移
CustomTransitionPage<void> rightSideSlideAnimation(Widget screen) {
  // アニメーションの始点終点
  const begin = Offset(1, 0);
  const end = Offset.zero;

  // アニメーションのカーブ
  const curve = Curves.easeInOutCubic;

  return CustomTransitionPage<void>(
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: begin,
            end: end,
          ).chain(
            CurveTween(curve: curve),
          ),
        ),
        child: child,
      );
    },
  );
}

// 下からスライドインするようなアニメーションの画面遷移
CustomTransitionPage<void> upperSlideAnimation(Widget screen) {
  const begin = Offset(0, 1);
  const end = Offset.zero;
  const curve = Curves.easeInOutCubic;

  return CustomTransitionPage<void>(
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: begin,
            end: end,
          ).chain(
            CurveTween(curve: curve),
          ),
        ),
        child: child,
      );
    },
  );
}

// 【試作】AndroidなどでもiOSライクな右からのスライドアニメーションをする画面遷移
CustomTransitionPage<void> cupertinoRightSlideAnimation2(Widget screen) {
  return CustomTransitionPage<void>(
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return CupertinoPageTransition(
        primaryRouteAnimation: animation,
        secondaryRouteAnimation: secondaryAnimation,
        linearTransition: false,
        child: child,
      );
    },
  );
}

// ダイアログで表示する画面遷移
Page<void> dialogAnimation(Widget screen) {
  return DialogPage<void>(
    builder: (_) => screen,
  );
}

// modal_bottom_sheetパッケージのshowMaterialModalBottomSheetの再現
Page<void> materialModalBottomSheetAnimation(Widget screen) {
  return MaterialModalBottomSheetPage<void>(
    builder: (_) => screen,
  );
}

// modal_bottom_sheetパッケージのshowBarModalBottomSheetの再現
Page<void> barModalBottomSheetAnimation(Widget screen) {
  return BarModalBottomSheetPage<void>(
    builder: (_) => screen,
  );
}

// modal_bottom_sheetパッケージのshowCupertinoModalBottomSheetの再現
Page<void> cupertinoModalBottomSheetAnimation(
    BuildContext context, GoRouterState state, Widget screen) {
  return CupertinoModalBottomSheetPage<void>(
    expand: true,
    backgroundColor: Colors.transparent,
    builder: (_) => screen,
  );
}

// 【試作】iOSライクなアニメーションの画面遷移（下からスライドイン）
// 現状：アニメーションのカーブがiOSらしくない
CustomTransitionPage<void> cupertinoUpperPageAnimation(Widget screen) {
  return CustomTransitionPage<void>(
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // アニメーションの始点終点
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;

      // アニメーションのカーブ
      const curve = Curves.easeInOut;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: CupertinoPageTransition(
          primaryRouteAnimation: animation,
          secondaryRouteAnimation: secondaryAnimation,
          linearTransition: false,
          child: child,
        ),
      );
    },
  );
}

// 【試作】iOSライクなモーダル遷移（下からスライドイン）のアニメーションの画面遷移
// 現状：アニメーションのカーブがiOSらしくない，モーダルの背景部分をタップしても閉じない，モーダルをスワイプで閉じると画面遷移が完了せずフリーズする
CustomTransitionPage<void> cupertinoModalPageAnimation(Widget screen) {
  // アニメーションの始点終点
  const begin = Offset(0, 1);
  const end = Offset.zero;

  // アニメーションのカーブ
  const curve = Curves.easeInOutCubic;

  final draggableScrollController = DraggableScrollableController();

  return CustomTransitionPage<void>(
    child: screen,
    fullscreenDialog: true,
    barrierColor: Colors.black.withOpacity(0.5),
    opaque: false,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: begin,
            end: end,
          ).chain(
            CurveTween(curve: curve),
          ),
        ),
        child: DraggableScrollableSheet(
          snap: true,
          snapAnimationDuration: const Duration(milliseconds: 150),
          controller: draggableScrollController,
          minChildSize: 0.0,
          initialChildSize: 0.88,
          maxChildSize: 0.9,
          shouldCloseOnMinExtent: true,
          builder: (_, scrollController) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: ColoredBox(
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  controller: scrollController,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
