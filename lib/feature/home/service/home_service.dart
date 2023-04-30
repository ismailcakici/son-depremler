import 'package:son_depremler/core/constants/enums/service_enums.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';
import 'package:son_depremler/feature/home/service/i_home_service.dart';
import 'package:son_depremler/product/constants/product_constants.dart';
import 'package:vexana/vexana.dart';

class HomeService extends IHomeService {
  HomeService(super.networkManager);

  @override
  Future<List<HomeModel>?> fetchLatestQuakes(
      String startTime, String endTime, int minmag) async {
    final response = await networkManager.send<HomeModel, List<HomeModel>>(
      ProductConstants.urlPath,
      queryParameters: {
        ServiceEnums.start.name: startTime,
        ServiceEnums.end.name: endTime,
        ServiceEnums.orderby.name: ServiceEnums.timedesc.name,
        ServiceEnums.minmag.name: minmag,
      },
      parseModel: HomeModel(),
      method: RequestType.GET,
    );
    return response.data;
  }
}
