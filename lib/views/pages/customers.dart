import 'package:flutter/material.dart';
import 'package:pharmacy_app/controllers/sqlhelper.dart';

import '../../models/customers.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersState();
}

class _CustomersState extends State<CustomersScreen> {
  late Future<List<Customers>> customers;
  final db = DatabaseHelper();

  @override
  void initState() {
    customers = db.getcustomers();
    db.init().whenComplete(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: customers,
            builder: (context, AsyncSnapshot<List<Customers>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].custname),
                      subtitle: Text(snapshot.data![index].company),
                      trailing: Text(snapshot.data![index].amount.toString()),
                    );
                  },
                );
              }
              return const Center(
                child: Text("No Customers not found"),
              );
            }));
  }
}
