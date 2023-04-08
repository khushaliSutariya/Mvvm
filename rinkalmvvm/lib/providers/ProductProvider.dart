import 'package:flutter/material.dart';

import '../Models/Productsmodel.dart';
import '../helper/ApiHandler.dart';
import '../helper/ErrorHandler.dart';

class ProductProvider extends ChangeNotifier {
  List<Productsmodel>? alldata;
  bool isloading = false;

  viewproducts() async {
    try {
      isloading = true;
      await ApiHandler.getcall(
              "http://picsyapps.com/studentapi/getProducts.php")
          .then((json) {
        alldata = json["data"]
            .map<Productsmodel>((obj) => Productsmodel.fromJson(obj))
            .toList();
        isloading = false;
        notifyListeners();
      });
    } on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //navigate no internet
      } else if (ex.message.toString() == "Bad Response Format") {
        //contact support
      } else {
        //support
      }
    }
  }

  bool isinserted = false;
  addproduct(params) async {
    try {
      isloading = true;
      await ApiHandler.postcall(
              "http://picsyapps.com/studentapi/insertProductNormal.php",
              body: params)
          .then((json) {
        if (json["status"] == "true") {
          isinserted = true;
        } else {
          isinserted = false;
        }
      });
    } on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //navigate no internet
      } else if (ex.message.toString() == "Bad Response Format") {
        //contact support
      } else {
        //support
      }
    }
  }

  bool isdeleted = false;
  deleteproduct(params) async {
    try {
      isloading = true;
      await ApiHandler.postcall(
              "http://picsyapps.com/studentapi/deleteproduct.php",
              body: params)
          .then((json) {
        if (json["status"] == "true") {
          isdeleted = true;
          viewproducts();
        } else {
          isdeleted = false;
        }
      });
    } on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //navigate no internet
      } else if (ex.message.toString() == "Bad Response Format") {
        //contact support
      } else {
        //support
      }
    }
  }
}
