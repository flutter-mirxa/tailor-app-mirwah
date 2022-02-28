import 'package:tailor_app_mirwah_mirxa/core/store.dart';

class SuitTypeParamModel {
  final String nTailorId;
  final String nSuitId;
  final String nParamId;
  final String sParamName;
  final String sDataType;
  final String nLowLimit;
  final String nHighLimit;
  final String bRequired;

  SuitTypeParamModel({
    this.nTailorId = "",
    this.nSuitId = "",
    this.nParamId = "",
    this.sParamName = "",
    this.sDataType = "",
    this.nLowLimit = "",
    this.nHighLimit = "",
    this.bRequired = "",
  });

  factory SuitTypeParamModel.fromMap(Map<String, dynamic> map) =>
      SuitTypeParamModel(
        nTailorId: map["nTailorId"],
        nSuitId: map["nSuitId"],
        nParamId: map["nParamId"],
        sParamName: map["sParamName"],
        sDataType: map["sDataType"],
        nLowLimit: map["nLowLimit"],
        nHighLimit: map["nHighLimit"],
        bRequired: map["bRequired"],
      );

  toMap() => {
        "nTailorId": nTailorId,
        "nSuitId": nSuitId,
        "nParamId": nParamId,
        "sParamName": sParamName,
        "sDataType": sDataType,
        "nLowLimit": nLowLimit,
        "nHighLimit": nHighLimit,
        "bRequired": bRequired,
      };
}

class SuitTypeParamListModel {
  static final _suitTypeParamListModel = SuitTypeParamListModel._interval();
  SuitTypeParamListModel._interval();
  factory SuitTypeParamListModel() => _suitTypeParamListModel;

  static List<SuitTypeParamModel> suitTypeParamArray = [];
}
