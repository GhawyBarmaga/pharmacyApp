// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'dart:convert';

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));

String customersToJson(Customers data) => json.encode(data.toJson());

class Customers {
    int id;
    String custName;
    String custCompny;
    DateTime creationDate;
    int creadit;
    String address;
    String phone;

    Customers({
        required this.id,
        required this.custName,
        required this.custCompny,
        required this.creationDate,
        required this.creadit,
        required this.address,
        required this.phone,
    });

    factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        custName: json["custName"],
        custCompny: json["custCompny"],
        creationDate: DateTime.parse(json["creationDate"]),
        creadit: json["creadit"],
        address: json["address"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "custName": custName,
        "custCompny": custCompny,
        "creationDate": creationDate.toIso8601String(),
        "creadit": creadit,
        "address": address,
        "phone": phone,
    };
}
