import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'home_model.g.dart';

@JsonSerializable(createToJson: false)
class HomeModel extends INetworkModel<HomeModel> {
  String? rms;
  String? eventID;
  String? location;
  String? latitude;
  String? longitude;
  String? depth;
  String? type;
  String? magnitude;
  String? country;
  String? province;
  String? district;
  String? neighborhood;
  String? date;
  String? lastUpdateDate;
  bool? isEventUpdate;

  HomeModel(
      {this.rms,
      this.eventID,
      this.location,
      this.latitude,
      this.longitude,
      this.depth,
      this.type,
      this.magnitude,
      this.country,
      this.province,
      this.district,
      this.neighborhood,
      this.date,
      this.isEventUpdate,
      this.lastUpdateDate});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }
}
