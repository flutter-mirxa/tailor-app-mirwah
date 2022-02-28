import 'package:tailor_app_mirwah_mirxa/core/store.dart';

class SuitTypeModel {
  final String nTailorId;
  final String nSuitId;
  final String sSuitType;
  final String nPrice;
  final String nCost;
  final bool bActive;

  SuitTypeModel(
      {this.nTailorId = "",
      this.nSuitId = "",
      this.sSuitType = "",
      this.nPrice = "",
      this.nCost = "",
      this.bActive = true});

  factory SuitTypeModel.fromMap(Map<String, dynamic> map) => SuitTypeModel(
        nTailorId: map["nTailorId"],
        nSuitId: map["nSuitId"],
        sSuitType: map["sSuitType"],
        nPrice: map["nPrice"],
        nCost: map["nCost"],
        bActive: map["bActive"],
      );

  toMap() => {
        "nTailorId": nTailorId,
        "nSuitId": nSuitId,
        "sSuitType": sSuitType,
        "nPrice": nPrice,
        "nCost": nCost,
        "bActive": bActive,
      };
}

class SuitTypeListModel {
  static final _suitTypeListModel = SuitTypeListModel._interval();
  SuitTypeListModel._interval();
  factory SuitTypeListModel() => _suitTypeListModel;

  static List<SuitTypeModel> suitTypeArray = [];
}
