import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 通常のアニメーションの画面遷移
MaterialPage<void> normalAnimation(Widget screen) {
  return MaterialPage<void>(
    child: screen,
  );
}

// 基本はnomalAnimationと同様だが、iOSのみモーダル遷移（下からスライドイン）するようなアニメーションの画面遷移
MaterialPage<void> fullScreenDialogAnimation(Widget screen) {
  return MaterialPage<void>(
    child: screen,
    fullscreenDialog: true,
  );
}

// アニメーションなしの画面遷移
CustomTransitionPage<void> withoutAnimation(Widget screen) {
  return CustomTransitionPage<void>(
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // アニメーションなしでただのchildを返す
    },
  );
}

// 右からスライドインするようなアニメーションの画面遷移
CustomTransitionPage<void> rightSideSlideAnimation(Widget screen) {
  const begin = Offset(1, 0);
  const end = Offset.zero;

  return CustomTransitionPage<void>(
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: begin,
            end: end,
          ).chain(
            CurveTween(curve: Curves.easeInOutCubic),
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

  return CustomTransitionPage<void>(
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: begin,
            end: end,
          ).chain(
            CurveTween(curve: Curves.easeInOutCubic),
          ),
        ),
        child: child,
      );
    },
  );
}

// iOSライクなアニメーションの画面遷移
CustomTransitionPage<void> cupertinoPageAnimation(Widget screen) {
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

// iOSライクなアニメーションの画面遷移（下からスライドイン）
CustomTransitionPage<void> cupertinoUpperPageAnimation(Widget screen) {
  return CustomTransitionPage<void>(
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
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

// iOSライクなモーダル遷移（下からスライドイン）のアニメーションの画面遷移
CustomTransitionPage<void> cupertinoModalPageAnimation(Widget screen) {
  const begin = Offset(0, 1);
  const end = Offset.zero;

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
            CurveTween(curve: Curves.easeInOutCubic),
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
