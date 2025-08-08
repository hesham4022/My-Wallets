import 'package:intl/intl.dart';

/// تحويل الأرقام الإنجليزية للعربية
String _toArabicDigits(String input) {
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const ar = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  for (int i = 0; i < en.length; i++) {
    input = input.replaceAll(en[i], ar[i]);
  }
  return input;
}

/// تنسيق: ٣١ يوليو ٢٠٢٥ (يوم + شهر بالعربي + سنة)
String formatCreatedAtArabic(String isoString) {
  final dt = DateTime.tryParse(isoString);
  if (dt == null) return 'تاريخ غير معروف';
  final formatted = DateFormat('d MMMM y', 'ar').format(dt);
  return _toArabicDigits(formatted);
}
