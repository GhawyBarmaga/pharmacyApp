// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'dart:convert';

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));

String customersToJson(Customers data) => json.encode(data.toJson());

class Customers {
    int id;
    String custname;
    String company;
    String currentDate;
    int amount;
    int phone;
    String address;

    Customers({
        required this.id,
        required this.custname,
        required this.company,
        required this.currentDate,
        required this.amount,
        required this.phone,
        required this.address,
    });

    factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        custname: json["custname"],
        company: json["company"],
        currentDate: json["current_date"],
        amount: json["amount"],
        phone: json["phone"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "custname": custname,
        "company": company,
        "current_date": currentDate,
        "amount": amount,
        "phone": phone,
        "address": address,
    };
}
