import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// global const
const Radius _kDefaultTopRadius = Radius.circular(12);
const double _kPreviousPageVisibleOffset = 10;
const BoxShadow _kDefaultBoxShadow =
    BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 5);

// -----------------------------------------------------------------------------
// materialパッケージの show~ 関数と同じ画面遷移を
// GoRouterのpageBuilderで利用するためのカスタムページ群
// -----------------------------------------------------------------------------
/// [showDialog]
/// A dialog page with Material entrance and exit animations, modal barrier color,
/// and modal barrier behavior (dialog is dismissible with a tap on the barrier).
class DialogPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;

  const DialogPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black54,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return DialogRoute<T>(
      context: context,
      builder: builder,
      anchorPoint: anchorPoint,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      themes: themes,
      settings: this,
    );
  }
}

/// [showModalBottomSheet]
class ModalBottomSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final Offset? anchorPoint;
  final String? barrierLabel;
  final bool isScrollControlled;
  final Color backgroundColor;
  final bool useSafeArea;
  final bool showDragHandle;
  final double elevation;
  final double maxHeightRatio;

  const ModalBottomSheetPage({
    required this.builder,
    this.anchorPoint,
    this.barrierLabel,
    this.isScrollControlled = true,
    this.backgroundColor = Colors.white,
    this.useSafeArea = true,
    this.showDragHandle = true,
    this.elevation = 1.0,
    this.maxHeightRatio = 0.5,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    final constraint = BoxConstraints(
      maxHeight: MediaQuery.sizeOf(context).height * maxHeightRatio,
    );

    return ModalBottomSheetRoute(
      builder: builder,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      constraints: constraint,
      useSafeArea: useSafeArea,
      showDragHandle: showDragHandle,
      elevation: elevation,
      settings: this,
    );
  }
}

// -----------------------------------------------------------------------------
// cupertinoパッケージの show~ 関数と同じ画面遷移を
// GoRouterのpageBuilderで利用するためのカスタムページ群
// -----------------------------------------------------------------------------
/// [showCupertinoModalPopup]
class CupertinoModalPopupPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String barrierLabel;
  final bool semanticsDismissible;
  final WidgetBuilder builder;
  final ImageFilter? filter;

  const CupertinoModalPopupPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = kCupertinoModalBarrierColor,
    this.barrierDismissible = true,
    this.barrierLabel = "Dismiss",
    this.semanticsDismissible = true,
    this.filter,
    super.key,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return CupertinoModalPopupRoute<T>(
      builder: builder,
      barrierDismissible: barrierDismissible,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      filter: filter,
      semanticsDismissible: semanticsDismissible,
      settings: this,
    );
  }
}

/// [showCupertinoDialog]
class CupertinoDialogPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final bool barrierDismissible;
  final Color barrierColor;
  final String barrierLabel;
  final Duration transitionDuration;
  final RouteTransitionsBuilder? transitionBuilder;
  final Offset? anchorPoint;

  const CupertinoDialogPage({
    required this.builder,
    this.barrierDismissible = true,
    this.barrierColor = kCupertinoModalBarrierColor,
    this.barrierLabel = 'Dismiss',
    this.transitionDuration = const Duration(milliseconds: 250),
    this.transitionBuilder,
    this.anchorPoint,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return CupertinoDialogRoute<T>(
      builder: builder,
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      settings: this,
      anchorPoint: anchorPoint,
    );
  }
}

// -----------------------------------------------------------------------------
// modal_bottom_sheetパッケージの show~ 関数と同じ画面遷移を
// GoRouterのpageBuilderで利用するためのカスタムページ群
// -----------------------------------------------------------------------------
/// [showMaterialModalBottomSheet]
class MaterialModalBottomSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final Color? barrierColor;
  final bool bounce;
  final bool expand;
  final AnimationController? secondAnimation;
  final Curve? animationCurve;
  final bool isDismissible;
  final bool enableDrag;
  final Duration? duration;
  final double? closeProgressThreshold;

  MaterialModalBottomSheetPage({
    required this.builder,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.barrierColor,
    this.bounce = false,
    this.expand = false,
    this.secondAnimation,
    this.animationCurve,
    this.isDismissible = true,
    this.enableDrag = true,
    this.duration,
    this.closeProgressThreshold,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalSheetRoute<T>(
      builder: builder,
      closeProgressThreshold: closeProgressThreshold,
      containerBuilder: _materialContainerBuilder(
        context,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehavior,
        theme: Theme.of(context),
      ),
      secondAnimationController: secondAnimation,
      bounce: bounce,
      expanded: expand,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      isDismissible: isDismissible,
      modalBarrierColor: barrierColor,
      enableDrag: enableDrag,
      animationCurve: animationCurve,
      duration: duration,
      settings: this,
    );
  }
}

// Default container builder is the Material Appearance
WidgetWithChildBuilder _materialContainerBuilder(BuildContext context,
    {Color? backgroundColor,
    double? elevation,
    ThemeData? theme,
    Clip? clipBehavior,
    ShapeBorder? shape}) {
  final bottomSheetTheme = Theme.of(context).bottomSheetTheme;
  final color = backgroundColor ??
      bottomSheetTheme.modalBackgroundColor ??
      bottomSheetTheme.backgroundColor;
  final effectiveElevation = elevation ?? bottomSheetTheme.elevation ?? 0.0;
  final effectiveShape = shape ?? bottomSheetTheme.shape;
  final effectiveClipBehavior =
      clipBehavior ?? bottomSheetTheme.clipBehavior ?? Clip.none;

  Widget result(context, animation, child) => Material(
        color: color,
        elevation: effectiveElevation,
        shape: effectiveShape,
        clipBehavior: effectiveClipBehavior,
        child: child,
      );
  if (theme != null) {
    return (context, animation, child) =>
        Theme(data: theme, child: result(context, animation, child));
  } else {
    return result;
  }
}

/// [showBarModalBottomSheet]
class BarModalBottomSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final Color barrierColor;
  final bool bounce;
  final bool expand;
  final AnimationController? secondAnimation;
  final Curve? animationCurve;
  final bool isDismissible;
  final bool enableDrag;
  final Widget? topControl;
  final Duration? duration;
  final SystemUiOverlayStyle? overlayStyle;
  final double? closeProgressThreshold;

  BarModalBottomSheetPage({
    required this.builder,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.barrierColor = Colors.black87,
    this.bounce = true,
    this.expand = false,
    this.secondAnimation,
    this.animationCurve,
    this.isDismissible = true,
    this.enableDrag = true,
    this.topControl,
    this.duration,
    this.overlayStyle,
    this.closeProgressThreshold,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalSheetRoute<T>(
      builder: builder,
      bounce: bounce,
      closeProgressThreshold: closeProgressThreshold,
      containerBuilder: (_, __, child) => BarBottomSheet(
        control: topControl,
        clipBehavior: clipBehavior,
        shape: shape,
        backgroundColor: backgroundColor,
        elevation: elevation,
        overlayStyle: overlayStyle,
        child: child,
      ),
      secondAnimationController: secondAnimation,
      expanded: expand,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      isDismissible: isDismissible,
      modalBarrierColor: barrierColor,
      enableDrag: enableDrag,
      animationCurve: animationCurve,
      duration: duration,
      settings: this,
    );
  }
}

/// [showCustomModalBottomSheet]
class CustomModalBottomSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final WidgetWithChildBuilder containerWidget;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final Color? barrierColor;
  final bool bounce;
  final bool expand;
  final AnimationController? secondAnimation;
  final Curve? animationCurve;
  final bool isDismissible;
  final bool enableDrag;
  final Duration? duration;
  final double? closeProgressThreshold;

  CustomModalBottomSheetPage({
    required this.builder,
    required this.containerWidget,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.barrierColor,
    this.bounce = false,
    this.expand = false,
    this.secondAnimation,
    this.animationCurve,
    this.isDismissible = true,
    this.enableDrag = true,
    this.duration,
    this.closeProgressThreshold,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    final hasMaterialLocalizations = Localizations.of<MaterialLocalizations>(
            context, MaterialLocalizations) !=
        null;
    final barrierLabel = hasMaterialLocalizations
        ? MaterialLocalizations.of(context).modalBarrierDismissLabel
        : '';

    return ModalSheetRoute<T>(
      builder: builder,
      bounce: bounce,
      containerBuilder: containerWidget,
      secondAnimationController: secondAnimation,
      expanded: expand,
      barrierLabel: barrierLabel,
      isDismissible: isDismissible,
      modalBarrierColor: barrierColor,
      enableDrag: enableDrag,
      animationCurve: animationCurve,
      duration: duration,
      settings: this,
      closeProgressThreshold: closeProgressThreshold,
    );
  }
}

/// [showCupertinoModalBottomSheet]
class CupertinoModalBottomSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final Color? barrierColor;
  final bool expand;
  final AnimationController? secondAnimation;
  final Curve? animationCurve;
  final Curve? previousRouteAnimationCurve;
  final bool bounce;
  final bool? isDismissible;
  final bool enableDrag;
  final Radius topRadius;
  final Duration? duration;
  final Color? transitionBackgroundColor;
  final BoxShadow? shadow;
  final SystemUiOverlayStyle? overlayStyle;
  final double? closeProgressThreshold;

  CupertinoModalBottomSheetPage({
    required this.builder,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.barrierColor,
    this.expand = false,
    this.secondAnimation,
    this.animationCurve,
    this.previousRouteAnimationCurve,
    this.bounce = true,
    this.isDismissible,
    this.enableDrag = true,
    this.topRadius = _kDefaultTopRadius,
    this.duration,
    this.transitionBackgroundColor,
    this.shadow,
    this.overlayStyle,
    this.closeProgressThreshold,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    final hasMaterialLocalizations = Localizations.of<MaterialLocalizations>(
            context, MaterialLocalizations) !=
        null;
    final barrierLabel = hasMaterialLocalizations
        ? MaterialLocalizations.of(context).modalBarrierDismissLabel
        : '';

    return CupertinoModalBottomSheetRoute<T>(
      builder: builder,
      containerBuilder: (context, _, child) => _CupertinoBottomSheetContainer(
        backgroundColor: backgroundColor,
        topRadius: topRadius,
        shadow: shadow,
        overlayStyle: overlayStyle,
        child: child,
      ),
      secondAnimationController: secondAnimation,
      expanded: expand,
      closeProgressThreshold: closeProgressThreshold,
      barrierLabel: barrierLabel,
      elevation: elevation,
      bounce: bounce,
      shape: shape,
      clipBehavior: clipBehavior,
      isDismissible: isDismissible ?? expand == false ? true : false,
      modalBarrierColor: barrierColor ?? Colors.black12,
      enableDrag: enableDrag,
      topRadius: topRadius,
      animationCurve: animationCurve,
      previousRouteAnimationCurve: previousRouteAnimationCurve,
      duration: duration,
      settings: this,
      transitionBackgroundColor: transitionBackgroundColor ?? Colors.black,
      overlayStyle: overlayStyle,
    );
  }
}

/// Cupertino Bottom Sheet Container
///
/// Clip the child widget to rectangle with top rounded corners and adds
/// top padding(+safe area padding). This padding [_kPreviousPageVisibleOffset]
/// is the height that will be displayed from previous route.
class _CupertinoBottomSheetContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Radius topRadius;
  final BoxShadow? shadow;
  final SystemUiOverlayStyle? overlayStyle;

  const _CupertinoBottomSheetContainer({
    required this.child,
    this.backgroundColor,
    required this.topRadius,
    this.overlayStyle,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    final scopedOverlayStyle = overlayStyle;
    final topSafeAreaPadding = MediaQuery.of(context).padding.top;
    final topPadding = _kPreviousPageVisibleOffset + topSafeAreaPadding;

    final shadow = this.shadow ?? _kDefaultBoxShadow;
    BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 5);
    final backgroundColor = this.backgroundColor ??
        CupertinoTheme.of(context).scaffoldBackgroundColor;
    Widget bottomSheetContainer = Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: topRadius),
        child: Container(
          decoration:
              BoxDecoration(color: backgroundColor, boxShadow: [shadow]),
          width: double.infinity,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true, //Remove top Safe Area
            child: CupertinoUserInterfaceLevel(
              data: CupertinoUserInterfaceLevelData.elevated,
              child: child,
            ),
          ),
        ),
      ),
    );
    if (scopedOverlayStyle != null) {
      bottomSheetContainer = AnnotatedRegion<SystemUiOverlayStyle>(
        value: scopedOverlayStyle,
        child: bottomSheetContainer,
      );
    }
    return bottomSheetContainer;
  }
}
