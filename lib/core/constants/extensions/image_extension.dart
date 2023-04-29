import 'package:son_depremler/core/constants/enums/image_enum.dart';

extension ImageExtension on ImageEnum {
  String get imagePath => 'assets/images/ic_$name.png';
}
