class ProductConstants {
  // Service
  static const String afadBaseUrl = 'https://deprem.afad.gov.tr/apiv2/event/';
  static const String urlPath = 'filter?';
  static DateTime dateTimeNow = DateTime.now();
  static DateTime dateTimeyesterday =
      DateTime.now().subtract(const Duration(days: 1));
}
