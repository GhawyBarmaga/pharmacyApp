import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/components.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersState();
}

class _CustomersState extends State<CustomersScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.dialog(Directionality(
                  textDirection: TextDirection.rtl,
                  child: AlertDialog(
                    actions: [
                      const SizedBox(height: 10.0),
                      CustomForm(
                        text: " الاسم",
                        type: TextInputType.name,
                        name: name,
                      ),
                      const SizedBox(height: 10.0),
                      CustomForm(
                        text: " العنوان",
                        type: TextInputType.streetAddress,
                        name: address,
                      ),
                      const SizedBox(height: 10.0),
                      CustomForm(
                        text: " رقم الهاتف",
                        type: TextInputType.phone,
                        name: phone,
                      ),
                      const SizedBox(height: 10.0),
                      CustomForm(
                        text: " الشركة",
                        type: TextInputType.name,
                        name: company,
                      ),
                      const SizedBox(height: 10.0),
                      CustomForm(
                        text: " المبلغ",
                        type: TextInputType.number,
                        name: amount,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //========================================Add Transactions=============================

                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  foregroundColor: Colors.white),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                "اضافه",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
                    ],
                  ),
                ));
              },
              child: const Icon(Icons.add),
            ),
            body: Column(
              children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      title: Text(""),
                      subtitle: Text(""),
                      trailing: Text(""),
                    );
                  },
                ),
              ],
            )));
  }
}
