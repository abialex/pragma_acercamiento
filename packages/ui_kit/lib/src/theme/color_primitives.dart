import 'package:flutter/material.dart';

/// Capa 1: Primitivos de Color
///
/// Paleta base con valores hexadecimales puros, sin lógica de negocio.
class ColorPrimitives {
  ColorPrimitives._(); // Private constructor

  // ============================================================================
  // ORANGE PRIMARY PALETTE - PMS 1655 (Dark Orange) - Color Primario
  // ============================================================================
  static const Color orangePrimary50 = Color(0xFFFEEDE5);
  static const Color orangePrimary100 = Color(0xFFFDCCC7);
  static const Color orangePrimary200 = Color(0xFFFCABA8);
  static const Color orangePrimary300 = Color(0xFFFB8A89);
  static const Color orangePrimary400 = Color(0xFFFA6876);
  static const Color orangePrimary500 = Color(0xFFFC4C02); // Base - PMS 1655 C
  static const Color orangePrimary600 = Color(0xFFE64001);
  static const Color orangePrimary700 = Color(0xFFCD3700);
  static const Color orangePrimary800 = Color(0xFFB33200);
  static const Color orangePrimary900 = Color(0xFF8C2600);

  // ============================================================================
  // PEACH SECONDARY PALETTE - PMS 712 (Peach) - Color Secundario
  // ============================================================================
  static const Color peachSecondary50 = Color(0xFFFFF6F0);
  static const Color peachSecondary100 = Color(0xFFFFE5D5);
  static const Color peachSecondary200 = Color(0xFFFFD4BB);
  static const Color peachSecondary300 = Color(0xFFFDC3A0);
  static const Color peachSecondary400 = Color(0xFFFCB391);
  static const Color peachSecondary500 = Color(0xFFFCC89B); // Base - PMS 712 C
  static const Color peachSecondary600 = Color(0xFFE5B48A);
  static const Color peachSecondary700 = Color(0xFFCDA079);
  static const Color peachSecondary800 = Color(0xFFB58C68);
  static const Color peachSecondary900 = Color(0xFF8D6C52);

  // ============================================================================
  // LIGHT ORANGE TERTIARY PALETTE - PMS 165 (Light Orange) - Color Terciario
  // ============================================================================
  static const Color orangeLight50 = Color(0xFFFEF2E5);
  static const Color orangeLight100 = Color(0xFFFDE3CC);
  static const Color orangeLight200 = Color(0xFFFCD4B2);
  static const Color orangeLight300 = Color(0xFFFAC599);
  static const Color orangeLight400 = Color(0xFFF9B680);
  static const Color orangeLight500 = Color(0xFFFF6720); // Base - PMS 165 C
  static const Color orangeLight600 = Color(0xFFE85C1F);
  static const Color orangeLight700 = Color(0xFFD05119);
  static const Color orangeLight800 = Color(0xFFB84613);
  static const Color orangeLight900 = Color(0xFF8B350D);

  // ============================================================================
  // RED ACCENT PALETTE - PMS 3516 (Red-Orange) - Color de Alerta
  // ============================================================================
  static const Color redAccent50 = Color(0xFFFAEAE8);
  static const Color redAccent100 = Color(0xFFF4D0CC);
  static const Color redAccent200 = Color(0xFFEDB5B0);
  static const Color redAccent300 = Color(0xFFE69A94);
  static const Color redAccent400 = Color(0xFFDF8578);
  static const Color redAccent500 = Color(0xFFDC3513); // Base - PMS 3516 C
  static const Color redAccent600 = Color(0xFFC82F10);
  static const Color redAccent700 = Color(0xFFB12A0E);
  static const Color redAccent800 = Color(0xFF9B250A);
  static const Color redAccent900 = Color(0xFF741D07);
  static const Color redPrimary = Color(0xFFEE2737);

  // ============================================================================
  // GRADIENT PALETTE
  // ============================================================================
  static const Color primaryGradientStart = Color(0xFFFF6720);

  // ============================================================================
  // NEUTRAL PALETTE - Grises Cálidos Minimalistas + Colores de Marca
  // ============================================================================
  static const Color neutral0 = Color(0xFFFFFFFF); // Pure White
  static const Color neutral50 = Color(0xFFEBE5DE); // Light Gray - PMS Base
  static const Color neutral100 = Color(0xFFE0D9D2);
  static const Color neutral200 = Color(0xFFD5CFCA);
  static const Color neutral300 = Color(0xFFC9C3BB);
  static const Color neutral400 = Color(0xFFAEA49C);
  static const Color neutral500 = Color(0xFF938B83);
  static const Color neutral600 = Color(0xFF78706A);
  static const Color neutral700 = Color(0xFF5D5551);
  static const Color neutral800 = Color(0xFF423C38);
  static const Color neutral900 = Color(0xFF091F2C); // PMS 5395 C - Dark Charcoal
  static const Color neutral1000 = Color(0xFF000000);

  // ============================================================================
  // SEMANTIC COLORS - Estados y Feedback
  // ============================================================================
  // Success
  static const Color success50 = Color(0xFFE8F5E9);
  static const Color success100 = Color(0xFFC8E6C9);
  static const Color success200 = Color(0xFFA5D6A7);
  static const Color success300 = Color(0xFF81C784);
  static const Color success400 = Color(0xFF66BB6A);
  static const Color success500 = Color(0xFF4CAF50); // Base
  static const Color success600 = Color(0xFF43A047);
  static const Color success700 = Color(0xFF388E3C);
  static const Color success800 = Color(0xFF2E7D32);
  static const Color success900 = Color(0xFF1B5E20);

  // Error
  static const Color error50 = Color(0xFFFEEBEE);
  static const Color error100 = Color(0xFFFFCDD2);
  static const Color error200 = Color(0xFFEF9A9A);
  static const Color error300 = Color(0xFFE57373);
  static const Color error400 = Color(0xFFEF5350);
  static const Color error500 = Color(0xFFF44336); // Base
  static const Color error600 = Color(0xFFE53935);
  static const Color error700 = Color(0xFFD32F2F);
  static const Color error800 = Color(0xFFC62828);
  static const Color error900 = Color(0xFFB71C1C);

  // Warning
  static const Color warning50 = Color(0xFFFFF8E1);
  static const Color warning100 = Color(0xFFFFECB3);
  static const Color warning200 = Color(0xFFFFE082);
  static const Color warning300 = Color(0xFFFFD54F);
  static const Color warning400 = Color(0xFFFFCA28);
  static const Color warning500 = Color(0xFFFFC107); // Base
  static const Color warning600 = Color(0xFFFFB300);
  static const Color warning700 = Color(0xFFFFA000);
  static const Color warning800 = Color(0xFFFF8F00);
  static const Color warning900 = Color(0xFFFF6F00);

  // Info
  static const Color info50 = Color(0xFFE3F2FD);
  static const Color info100 = Color(0xFFBBDEFB);
  static const Color info200 = Color(0xFF90CAF9);
  static const Color info300 = Color(0xFF64B5F6);
  static const Color info400 = Color(0xFF42A5F5);
  static const Color info500 = Color(0xFF2196F3); // Base
  static const Color info600 = Color(0xFF1E88E5);
  static const Color info700 = Color(0xFF1976D2);
  static const Color info800 = Color(0xFF1565C0);
  static const Color info900 = Color(0xFF0D47A1);

  // ============================================================================
  // MONEDA PEN PALETTE
  // ============================================================================
  static const Color monedaPen50 = Color(0xFFE8F5E9);
  static const Color monedaPen100 = Color(0xFFC8E6C9);
  static const Color monedaPen200 = Color(0xFFA5D6A7);
  static const Color monedaPen300 = Color(0xFF81C784);
  static const Color monedaPen400 = Color(0xFF66BB6A);
  static const Color monedaPen500 = Color(0xFF4CAF50); // Base
  static const Color monedaPen600 = Color(0xFF43A047);
  static const Color monedaPen700 = Color(0xFF388E3C);
  static const Color monedaPen800 = Color(0xFF2E7D32);
  static const Color monedaPen900 = Color(0xFF1B5E20);

  // ============================================================================
  // MONEDA USD PALETTE
  // ============================================================================
  static const Color monedaUsd50 = Color(0xFFE3F2FD);
  static const Color monedaUsd100 = Color(0xFFBBDEFB);
  static const Color monedaUsd200 = Color(0xFF90CAF9);
  static const Color monedaUsd300 = Color(0xFF64B5F6);
  static const Color monedaUsd400 = Color(0xFF42A5F5);
  static const Color monedaUsd500 = Color(0xFF2196F3); // Base
  static const Color monedaUsd600 = Color(0xFF1E88E5);
  static const Color monedaUsd700 = Color(0xFF1976D2);
  static const Color monedaUsd800 = Color(0xFF1565C0);
  static const Color monedaUsd900 = Color(0xFF0D47A1);

  // ============================================================================
  // OCUPACION PALETTE
  // ============================================================================
  static const Color ocupacion50 = Color(0xFFEFEBE9);
  static const Color ocupacion100 = Color(0xFFD7CCC8);
  static const Color ocupacion200 = Color(0xFFBCAAA4);
  static const Color ocupacion300 = Color(0xFFA1887F);
  static const Color ocupacion400 = Color(0xFF8D6E63); // Base
  static const Color ocupacion500 = Color(0xFF795548);
  static const Color ocupacion600 = Color(0xFF6D4C41);
  static const Color ocupacion700 = Color(0xFF5D4037);
  static const Color ocupacion800 = Color(0xFF4E342E);
  static const Color ocupacion900 = Color(0xFF3E2723);

  // ============================================================================
  // INDISPONIBILIDAD PALETTE
  // ============================================================================
  static const Color indisponibilidad50 = Color(0xFFFAFAFA);
  static const Color indisponibilidad100 = Color(0xFFF5F5F5);
  static const Color indisponibilidad200 = Color(0xFFEEEEEE);
  static const Color indisponibilidad300 = Color(0xFFE0E0E0);
  static const Color indisponibilidad400 = Color(0xFFBDBDBD); // Base
  static const Color indisponibilidad500 = Color(0xFF9E9E9E);
  static const Color indisponibilidad600 = Color(0xFF757575);
  static const Color indisponibilidad700 = Color(0xFF616161);
  static const Color indisponibilidad800 = Color(0xFF424242);
  static const Color indisponibilidad900 = Color(0xFF212121);

  // ============================================================================
  // SPECIAL COLORS
  // ============================================================================
  static const Color transparent = Color(0x00000000);
  static const Color scrim = Color(0x80000000);
  static const Color overlay = Color(0x14000000);
}

class PragmaColors {
  // Purples & Violets
  static const Color purple900 = Color(0xFF1A0B3B); // Fondo profundo
  static const Color purple800 = Color(0xFF2D1B5E); // Superficie de tarjetas
  static const Color violet500 = Color(0xFF8B5CF6); // Acento principal (Brillante)
  static const Color violet600 = Color(0xFF7C3AED); // Acento secundario (Profundo)

  // Neutrals
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color glassWhite = Color(0x1AFFFFFF); // Blanco con 10% opacidad
}
