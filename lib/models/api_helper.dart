// import 'dart:convert';

// import 'package:pharmacy_app/models/customers.dart';
// import 'package:http/http.dart' as http;

// class ApiHelper {
//   final String baseUri = "http://localhost:5256/api/Customers/getCustomers";

//   Future<List<Customers>> getcustomers() async {
//     List<Customers> data = [];

//     final uri = Uri.parse(baseUri);
//     try {
//       final response = await http.get(
//         uri,
//         headers: <String, String>{
//           'Content-type': 'application/json; charset=UTF-8',
//         },
//       );

//       if (response.statusCode >= 200 && response.statusCode <= 299) {
//         final List<dynamic> jsonData = json.decode(response.body);
//         data = jsonData.map((json) => Customers.fromJson(json)).toList();
//       }
//     } catch (e) {
//       return data;
//     }
//     return data;
//   }
// }
