import 'package:flutter/material.dart';
import 'package:limix_test/features/ai_models/widget/custom_container.dart';

import 'fish_disease_screen.dart';

class AiModelScreen extends StatelessWidget {
  const AiModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(
        flexibleSpace:
        Container(
          decoration:
          BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff224B8F),
                    Color(0xff3A6BC1),
                  ] ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -4,
                    color: Color(0x1A000000)
                ),
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    spreadRadius: -3,
                    color: Color(0x1A000000)
                )
              ]
          ) ,
        ),
        title:
        Row(
          children: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.arrow_back, color: Colors.white,size: 25,)
            ),
            SizedBox(width: 2,),
            Container(
              height: 39.972755432128906,
             width: 39.972755432128906,
             decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(16),
               shape: BoxShape.rectangle,
               color: Colors.white.withOpacity(0.2)
               ),
              child: Icon(Icons.psychology_outlined,color: Colors.white,size: 30,
             ),
            ),
             SizedBox(
               width: 12,
             ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( 'AI Models',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text( 'Advanced fish farming intelligence',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 23,top: 20),

              child: Text("Used AI Models",
                style: TextStyle(
                  color: Color(0xff4A5565),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
              ),
            ),
            SizedBox(height: 16,),
            CustomContainer(
                title: "Fish Disease Detection",
                subTitle: "Identify diseases from images",
                value: "5",
                icon: Icons.medication_rounded,
                iconColor: Color(0xffEF4444),
                borderColor: Color(0xffFB2C36),
                buttonColor: Color(0xffFB2C36),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FishDiseaseScreen(),));
                },
                backgroundColor: Color(0xffFFE2E2),
                valueName: "Detected:",
                valueColor: Color(0xffFB2C36),
            ),
            SizedBox(height: 16,),
           CustomContainer(
               title: "Water Quality",
               subTitle: "Current sensor readings",
               value: "Good",
               icon: Icons.trending_up,
               iconColor: Color(0xff10B981),
               borderColor: Color(0xff00BC7D),
               buttonColor: Color(0xff00BC7D),
               onTap: (){},
               backgroundColor:Color(0xffD0FAE5) ,
               valueName: "Status:",
               valueColor: Color(0xff00BC7D),
           ),
            SizedBox(height: 16,),
           CustomContainer(
               title: "Fish species Recommendations",
               subTitle: "recommend different species",
               value: "4      ",
               icon: Icons.water_drop_outlined,
               iconColor: Color(0xff3B82F6),
               borderColor: Color(0xff2B7FFF),
               buttonColor: Color(0xff2B7FFF),
               onTap: (){},
               backgroundColor: Color(0xffDBEAFE),
               valueName:"Found:",
               valueColor:Color(0xff2B7FFF),
           ),
            SizedBox(height: 16,),
            CustomContainer(
              title: "Sensor Forecast",
              subTitle: "Predict future readings",
              value: " 7d    ",
              icon: Icons.stacked_line_chart,
              iconColor: Color(0xffF59E0B),
              borderColor: Color(0xffFE9A00),
              buttonColor:Color(0xffFE9A00),
              onTap: (){},
              backgroundColor: Color(0xffFEF3C6),
              valueName:"Period:",
              valueColor:Color(0xffFE9A00),
            ),
            SizedBox(height: 16,),
            CustomContainer(
              title: "Biomass & Activity",
              subTitle: "Real-time monitoring",
              value: " 1.2k    ",
              icon: Icons.balance_outlined,
              iconColor: Color(0xff8B5CF6),
              borderColor: Color(0xff8E51FF),
              buttonColor:Color(0xff8E51FF),
              onTap: (){},
              backgroundColor: Color(0xffEDE9FE),
              valueName:"Total::",
              valueColor:Color(0xff8E51FF),
            ),
    ]
      ),
      )
    );
  }
}