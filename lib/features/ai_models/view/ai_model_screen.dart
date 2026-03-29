import 'package:flutter/material.dart';
import 'package:limix_test/features/ai_models/widget/custom_container.dart';

import '../../../core/constants/custom_appbar.dart';
import 'fish_disease_screen.dart';

class AiModelScreen extends StatelessWidget {
  const AiModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            title: "AI Models",
            subTitle: "Advanced fish farming intelligence",
            showBackButton: true,
            onTap: (){},
            iconBgColor:Colors.white.withOpacity(0.2) ,
            icon: Icons.psychology_outlined,
            iconColor: Colors.white
          )
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