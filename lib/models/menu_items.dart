import 'package:flutter/material.dart';
import 'package:pharmacy_app/models/menu_details.dart';
import 'package:pharmacy_app/views/pages/customers.dart';

import '../views/pages/dashboard.dart';
import '../views/pages/notifications.dart';
import '../views/pages/pages.dart';
import '../views/pages/reports.dart';

class MenuItems {
  List<MenuDetails> items = [
    MenuDetails(title: "Dashboard", icon: Icons.home, page: const Dashboard()),
    MenuDetails(
        title: "Customers",
        icon: Icons.person_off_outlined,
        page: const Customers()),
    MenuDetails(
        title: "Notifications",
        icon: Icons.notification_important_rounded,
        page: const Notifications()),
    MenuDetails(title: "Reports", icon: Icons.add_chart, page: const Reports()),
    MenuDetails(
        title: "Settings", icon: Icons.settings, page: const Settings()),
  ];
}
