import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6e5d00),
      surfaceTint: Color(0xff6e5d00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffde3f),
      onPrimaryContainer: Color(0xff736100),
      secondary: Color(0xff6b5e24),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff2df98),
      onSecondaryContainer: Color(0xff6f6228),
      tertiary: Color(0xff4d6700),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc6ed6b),
      onTertiaryContainer: Color(0xff506b00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff9ee),
      onSurface: Color(0xff1e1b11),
      onSurfaceVariant: Color(0xff4c4733),
      outline: Color(0xff7d7761),
      outlineVariant: Color(0xffcfc6ad),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343025),
      inversePrimary: Color(0xffe5c524),
      primaryFixed: Color(0xffffe25e),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffe5c524),
      onPrimaryFixedVariant: Color(0xff534600),
      secondaryFixed: Color(0xfff5e29b),
      onSecondaryFixed: Color(0xff221b00),
      secondaryFixedDim: Color(0xffd8c682),
      onSecondaryFixedVariant: Color(0xff52460e),
      tertiaryFixed: Color(0xffc9f16e),
      onTertiaryFixed: Color(0xff151f00),
      tertiaryFixedDim: Color(0xffaed455),
      onTertiaryFixedVariant: Color(0xff394d00),
      surfaceDim: Color(0xffe0d9c9),
      surfaceBright: Color(0xfffff9ee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf3e2),
      surfaceContainer: Color(0xfff5eddd),
      surfaceContainerHigh: Color(0xffefe8d7),
      surfaceContainerHighest: Color(0xffe9e2d1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff403600),
      surfaceTint: Color(0xff6e5d00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff7f6c00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff403600),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7a6d31),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2b3c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff597700),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff9ee),
      onSurface: Color(0xff131108),
      onSurfaceVariant: Color(0xff3b3624),
      outline: Color(0xff58523e),
      outlineVariant: Color(0xff736d57),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343025),
      inversePrimary: Color(0xffe5c524),
      primaryFixed: Color(0xff7f6c00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff635400),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7a6d31),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff61541b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff597700),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff455d00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcdc6b6),
      surfaceBright: Color(0xfffff9ee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf3e2),
      surfaceContainer: Color(0xffefe8d7),
      surfaceContainerHigh: Color(0xffe3dccc),
      surfaceContainerHighest: Color(0xffd8d1c1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff352c00),
      surfaceTint: Color(0xff6e5d00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff564800),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff352c00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff544910),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff233100),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3b5000),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff9ee),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff312c1b),
      outlineVariant: Color(0xff4e4936),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343025),
      inversePrimary: Color(0xffe5c524),
      primaryFixed: Color(0xff564800),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3c3200),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff544910),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3c3200),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3b5000),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff283800),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbfb8a9),
      surfaceBright: Color(0xfffff9ee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f0df),
      surfaceContainer: Color(0xffe9e2d1),
      surfaceContainerHigh: Color(0xffdbd4c4),
      surfaceContainerHighest: Color(0xffcdc6b6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaff),
      surfaceTint: Color(0xffe5c524),
      onPrimary: Color(0xff3a3000),
      primaryContainer: Color(0xffffde3f),
      onPrimaryContainer: Color(0xff736100),
      secondary: Color(0xffd8c682),
      onSecondary: Color(0xff3a3000),
      secondaryContainer: Color(0xff544910),
      onSecondaryContainer: Color(0xffc9b875),
      tertiary: Color(0xfff8ffdf),
      onTertiary: Color(0xff263500),
      tertiaryContainer: Color(0xffc6ed6b),
      onTertiaryContainer: Color(0xff506b00),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff16130a),
      onSurface: Color(0xffe9e2d1),
      onSurfaceVariant: Color(0xffcfc6ad),
      outline: Color(0xff989079),
      outlineVariant: Color(0xff4c4733),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e2d1),
      inversePrimary: Color(0xff6e5d00),
      primaryFixed: Color(0xffffe25e),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffe5c524),
      onPrimaryFixedVariant: Color(0xff534600),
      secondaryFixed: Color(0xfff5e29b),
      onSecondaryFixed: Color(0xff221b00),
      secondaryFixedDim: Color(0xffd8c682),
      onSecondaryFixedVariant: Color(0xff52460e),
      tertiaryFixed: Color(0xffc9f16e),
      onTertiaryFixed: Color(0xff151f00),
      tertiaryFixedDim: Color(0xffaed455),
      onTertiaryFixedVariant: Color(0xff394d00),
      surfaceDim: Color(0xff16130a),
      surfaceBright: Color(0xff3d392e),
      surfaceContainerLowest: Color(0xff100e06),
      surfaceContainerLow: Color(0xff1e1b11),
      surfaceContainer: Color(0xff222015),
      surfaceContainerHigh: Color(0xff2d2a1f),
      surfaceContainerHighest: Color(0xff383529),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaff),
      surfaceTint: Color(0xffe5c524),
      onPrimary: Color(0xff3a3000),
      primaryContainer: Color(0xffffde3f),
      onPrimaryContainer: Color(0xff524500),
      secondary: Color(0xffeedc95),
      onSecondary: Color(0xff2d2500),
      secondaryContainer: Color(0xffa09051),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff8ffdf),
      onTertiary: Color(0xff263500),
      tertiaryContainer: Color(0xffc6ed6b),
      onTertiaryContainer: Color(0xff384c00),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff16130a),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe5dcc2),
      outline: Color(0xffbab299),
      outlineVariant: Color(0xff979079),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e2d1),
      inversePrimary: Color(0xff554700),
      primaryFixed: Color(0xffffe25e),
      onPrimaryFixed: Color(0xff161100),
      primaryFixedDim: Color(0xffe5c524),
      onPrimaryFixedVariant: Color(0xff403600),
      secondaryFixed: Color(0xfff5e29b),
      onSecondaryFixed: Color(0xff161100),
      secondaryFixedDim: Color(0xffd8c682),
      onSecondaryFixedVariant: Color(0xff403600),
      tertiaryFixed: Color(0xffc9f16e),
      onTertiaryFixed: Color(0xff0c1400),
      tertiaryFixedDim: Color(0xffaed455),
      onTertiaryFixedVariant: Color(0xff2b3c00),
      surfaceDim: Color(0xff16130a),
      surfaceBright: Color(0xff484438),
      surfaceContainerLowest: Color(0xff090702),
      surfaceContainerLow: Color(0xff201d13),
      surfaceContainer: Color(0xff2b281d),
      surfaceContainerHigh: Color(0xff363227),
      surfaceContainerHighest: Color(0xff413d32),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaff),
      surfaceTint: Color(0xffe5c524),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffde3f),
      onPrimaryContainer: Color(0xff302700),
      secondary: Color(0xfffff0ba),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd4c27e),
      onSecondaryContainer: Color(0xff0f0b00),
      tertiary: Color(0xfff8ffdf),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc6ed6b),
      onTertiaryContainer: Color(0xff1f2c00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff16130a),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff9f0d5),
      outlineVariant: Color(0xffcbc2a9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e2d1),
      inversePrimary: Color(0xff554700),
      primaryFixed: Color(0xffffe25e),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe5c524),
      onPrimaryFixedVariant: Color(0xff161100),
      secondaryFixed: Color(0xfff5e29b),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd8c682),
      onSecondaryFixedVariant: Color(0xff161100),
      tertiaryFixed: Color(0xffc9f16e),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffaed455),
      onTertiaryFixedVariant: Color(0xff0c1400),
      surfaceDim: Color(0xff16130a),
      surfaceBright: Color(0xff545043),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff222015),
      surfaceContainer: Color(0xff343025),
      surfaceContainerHigh: Color(0xff3f3b30),
      surfaceContainerHighest: Color(0xff4a473b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
