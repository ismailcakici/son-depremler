import 'package:son_depremler/product/constants/product_constants.dart';
import 'package:vexana/vexana.dart';

class ServiceManager {
  static ServiceManager? _instance;
  static ServiceManager get instance {
    _instance ??= ServiceManager._init();
    return _instance!;
  }

  ServiceManager._init();
  // ignore: prefer_void_to_null
  final INetworkManager networkManager = NetworkManager<Null>(
    options: BaseOptions(
      baseUrl: ProductConstants.afadBaseUrl,
    ),
  );
}
