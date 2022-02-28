import 'package:tailor_app_mirwah_mirxa/core/store.dart';

class CustomerModel {
  final String nTailorId;
  final String nCustomerId;
  final String sCustomerCode;
  final String sCustomerName;
  final String sRegViaEmailOrMobile;
  final String sEmail;
  final String sMobileNo;
  final String sPicPath;
  final String dRegDate;
  final bool bActive;

  CustomerModel({
    this.nTailorId = "",
    this.nCustomerId = "",
    this.sCustomerCode = "",
    this.sCustomerName = "",
    this.sRegViaEmailOrMobile = "",
    this.sEmail = "",
    this.sMobileNo = "",
    this.sPicPath = "",
    this.dRegDate = "",
    this.bActive = false,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> map) => CustomerModel(
        nTailorId: map["nTailorId"],
        nCustomerId: map["nCustomerId"],
        sCustomerCode: map["sCustomerCode"],
        sCustomerName: map["sCustomerName"],
        sRegViaEmailOrMobile: map["sRegViaEmailOrMobile"],
        sEmail: map["sEmail"],
        sMobileNo: map["sMobileNo"],
        sPicPath: map["sPicPath"],
        dRegDate: map["dRegDate"],
        bActive: map["bActive"],
      );

  toMap() => {
        "nTailorId": nTailorId,
        "nCustomerId": nCustomerId,
        "sCustomerCode": sCustomerCode,
        "sCustomerName": sCustomerName,
        "sRegViaEmailOrMobile": sRegViaEmailOrMobile,
        "sEmail": sEmail,
        "sMobileNo": sMobileNo,
        "sPicPath": sPicPath,
        "dRegDate": dRegDate,
        "bActive": bActive,
      };
}

class CustomerListModel {
  static final _customerListModel = CustomerListModel._interval();
  CustomerListModel._interval();
  factory CustomerListModel() => _customerListModel;

  static List<CustomerModel> customerArray = [];
}
