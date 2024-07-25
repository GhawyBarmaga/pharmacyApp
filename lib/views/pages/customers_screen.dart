import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controllers/customers_controllers.dart';

import '../components/components.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: GetBuilder<CustomersControllers>(
          builder: (CustomersControllers controller) => Scaffold(
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
                          name: controller.name,
                        ),
                        const SizedBox(height: 10.0),
                        CustomForm(
                          text: " العنوان",
                          type: TextInputType.streetAddress,
                          name: controller.address,
                        ),
                        const SizedBox(height: 10.0),
                        CustomForm(
                          text: " رقم الهاتف",
                          type: TextInputType.phone,
                          name: controller.phone,
                        ),
                        const SizedBox(height: 10.0),
                        CustomForm(
                          text: " الشركة",
                          type: TextInputType.name,
                          name: controller.company,
                        ),
                        const SizedBox(height: 10.0),
                        CustomForm(
                          text: " المبلغ",
                          type: TextInputType.number,
                          name: controller.amount,
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
                                  controller.getcustomers();
                                  Get.back();
                                },
                                child: const Text(
                                  "اضافه",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )
                      ],
                    ),
                    //================================================================================
                  ));
                },
                child: const Icon(Icons.add),
              ),
              body: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          controller.data[index].custName,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(controller.data[index].custCompny),
                        trailing: Text("${controller.data[index].creadit}"),
                      );
                    },
                  ),
                ],
              )),
        ));
  }
}
