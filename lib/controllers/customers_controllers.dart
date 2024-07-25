import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pharmacy_app/models/customers.dart';

class CustomersControllers extends GetxController {
  TextEditingController name = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController company = TextEditingController();

  TextEditingController amount = TextEditingController();

  late List<Customers> data = [];

  @override
  void onInit() {
    getcustomers();
    super.onInit();
  }

  void getcustomers() async {
    update();
  }
}
