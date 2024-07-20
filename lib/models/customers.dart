// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'dart:convert';

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));

String customersToJson(Customers data) => json.encode(data.toJson());

class Customers {
    int id;
    String custname;
    String custCompny;
    String creationDate;
    int creadit;
    int phone;
    String address;

    Customers({
        required this.id,
        required this.custname,
        required this.custCompny,
        required this.creationDate,
        required this.creadit,
        required this.phone,
        required this.address,
    });

    factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        custname: json["Custname"],
        custCompny: json["CustCompny"],
        creationDate: json["CreationDate"],
        creadit: json["Creadit"],
        phone: json["Phone"],
        address: json["Address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Custname": custname,
        "CustCompny": custCompny,
        "CreationDate": creationDate,
        "Creadit": creadit,
        "Phone": phone,
        "Address": address,
    };
}
