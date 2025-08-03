import 'package:first_task/custom_widget/custom_widget_of_homePage/custome_card.dart';
import 'package:first_task/custom_widget/custom_widget_of_homePage/custome_shape.dart';
import 'package:first_task/custom_widget/custom_widget_of_homePage/precentage_shape.dart';
import 'package:flutter/material.dart';

class MyWalletsInhomepage extends StatelessWidget {
  const MyWalletsInhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomShape(
              color: Color(0xff757575),
              width: 120,
              text: "Remaining",
            ),
            CustomShape(
              color: Colors.blue,
              width: 90,
              text: "2.7% ds",
            ),
            CustomShape(
              color: Colors.blue,
              width: 90,
              text: "94.9% b",
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        BalanceIndicator(
          current: 2000,
          radius: 110,
          desText: 'الرصيد الحالي',
          available: "",
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Custom_Card(
              iconcard: Icon(Icons.call_split, color: Colors.white),
              textcard: "توزيع",
            ),
            Custom_Card(
              iconcard: Icon(Icons.swap_horiz, color: Colors.white),
              textcard: "نقل",
            ),
            Custom_Card(
              iconcard: Icon(Icons.remove_circle_rounded, color: Colors.white),
              textcard: "سحب",
            ),
            Custom_Card(
              iconcard: Icon(Icons.add_circle_rounded, color: Colors.white),
              textcard: "إضافة",
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("تراجع", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 7),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(
                        3.1416), // تعكس الاتجاه أفقيًا (180 درجة)
                    child: Icon(Icons.undo, color: Colors.white),
                  )
                ],
              ),
              Text("المعاملات الاخيرة",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xff392f48),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff3e3852), width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "- 50.00 ج.م",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "b",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text("b",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12)),
                          SizedBox(height: 4),
                          Text("يونيو 2025",
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 10)),
                        ],
                      ),
                      SizedBox(width: 12),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.red.withOpacity(0.15),
                        child:
                            Icon(Icons.arrow_upward, color: Colors.redAccent),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
