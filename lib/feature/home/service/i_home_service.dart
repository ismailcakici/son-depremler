import 'package:son_depremler/feature/home/model/home_model.dart';
import 'package:vexana/vexana.dart';

abstract class IHomeService {
  final INetworkManager networkManager;

  IHomeService(this.networkManager);

  Future<List<HomeModel>?> fetchLatestQuakes(
      String startTime, String endTime, int minmag);
}
