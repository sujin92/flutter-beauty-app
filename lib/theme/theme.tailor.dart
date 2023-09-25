// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class BeautyTheme extends ThemeExtension<BeautyTheme> {
  const BeautyTheme({
    required this.basicBlack,
    required this.mainColor,
    required this.pointColor,
    required this.transGray,
    required this.whiteColor,
  });

  final Color basicBlack;
  final Color mainColor;
  final Color pointColor;
  final Color transGray;
  final Color whiteColor;

  static final BeautyTheme light = BeautyTheme(
    basicBlack: _$BeautyTheme.basicBlack[0],
    mainColor: _$BeautyTheme.mainColor[0],
    pointColor: _$BeautyTheme.pointColor[0],
    transGray: _$BeautyTheme.transGray[0],
    whiteColor: _$BeautyTheme.whiteColor[0],
  );

  static final BeautyTheme dark = BeautyTheme(
    basicBlack: _$BeautyTheme.basicBlack[1],
    mainColor: _$BeautyTheme.mainColor[1],
    pointColor: _$BeautyTheme.pointColor[1],
    transGray: _$BeautyTheme.transGray[1],
    whiteColor: _$BeautyTheme.whiteColor[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  BeautyTheme copyWith({
    Color? basicBlack,
    Color? mainColor,
    Color? pointColor,
    Color? transGray,
    Color? whiteColor,
  }) {
    return BeautyTheme(
      basicBlack: basicBlack ?? this.basicBlack,
      mainColor: mainColor ?? this.mainColor,
      pointColor: pointColor ?? this.pointColor,
      transGray: transGray ?? this.transGray,
      whiteColor: whiteColor ?? this.whiteColor,
    );
  }

  @override
  BeautyTheme lerp(covariant ThemeExtension<BeautyTheme>? other, double t) {
    if (other is! BeautyTheme) return this as BeautyTheme;
    return BeautyTheme(
      basicBlack: Color.lerp(basicBlack, other.basicBlack, t)!,
      mainColor: Color.lerp(mainColor, other.mainColor, t)!,
      pointColor: Color.lerp(pointColor, other.pointColor, t)!,
      transGray: Color.lerp(transGray, other.transGray, t)!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BeautyTheme &&
            const DeepCollectionEquality()
                .equals(basicBlack, other.basicBlack) &&
            const DeepCollectionEquality().equals(mainColor, other.mainColor) &&
            const DeepCollectionEquality()
                .equals(pointColor, other.pointColor) &&
            const DeepCollectionEquality().equals(transGray, other.transGray) &&
            const DeepCollectionEquality()
                .equals(whiteColor, other.whiteColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(basicBlack),
      const DeepCollectionEquality().hash(mainColor),
      const DeepCollectionEquality().hash(pointColor),
      const DeepCollectionEquality().hash(transGray),
      const DeepCollectionEquality().hash(whiteColor),
    );
  }
}

extension BeautyThemeBuildContextProps on BuildContext {
  BeautyTheme get beautyTheme => Theme.of(this).extension<BeautyTheme>()!;
  Color get basicBlack => beautyTheme.basicBlack;
  Color get mainColor => beautyTheme.mainColor;
  Color get pointColor => beautyTheme.pointColor;
  Color get transGray => beautyTheme.transGray;
  Color get whiteColor => beautyTheme.whiteColor;
}
