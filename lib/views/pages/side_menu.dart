import 'package:flutter/material.dart';
import 'package:pharmacy_app/models/menu_items.dart';
import 'package:hexcolor/hexcolor.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _MenuState();
}

class _MenuState extends State<SideMenu> {
  final controller = MenuItems();
  int currentIndex = 0;
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          background(Column(
            children: [
              //Header
              CircleAvatar(
                  radius: 80, child: Image.asset("assets/images/pharmacy.png")),

              //Body
              Expanded(
                flex: 3,
                child: ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      selectedItem = currentIndex == index;
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: selectedItem
                                ? Colors.white.withOpacity(.09)
                                : Colors.transparent),
                        child: ListTile(
                          title: Text(controller.items[index].title),
                          leading: Icon(controller.items[index].icon),
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      );
                    }),
              ),

              //End
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("LOGOUT"),
                    )
                  ],
                ),
              )
            ],
          )),

          //Pages
          Expanded(
              child: PageView.builder(
                  itemCount: controller.items.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: controller.items[currentIndex].page,
                    );
                  }))
        ],
      ),
    ));
  }
}

// background of side menu
Widget background(Widget child) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    width: 200,
    height: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.8),
              blurRadius: 1,
              spreadRadius: 0)
        ],
        color: HexColor("333333")),
    child: child,
  );
}
