import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// アニメーションなしの画面遷移
CustomTransitionPage<void> withoutAnimation(Widget page) {
  return CustomTransitionPage<void>(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // アニメーションなしでただのchildを返す
    },
  );
}

// 右からスライドイン×フェードインするようなアニメーションの画面遷移
CustomTransitionPage<void> rightSideSlideAnimation(Widget page) {
  return CustomTransitionPage<void>(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
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
CustomTransitionPage<void> upperSlideAnimation(Widget page) {
  return CustomTransitionPage<void>(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.easeInOutCubic),
          ),
        ),
        child: child,
      );
    },
  );
}
