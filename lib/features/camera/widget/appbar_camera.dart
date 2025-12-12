import 'package:flutter/material.dart';
class AppbarCamera extends StatelessWidget {
  const AppbarCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color:Colors.white),
      backgroundColor: Color(0xff000000).withOpacity(0.8),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Live Camera",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 2,),
          Row(
            children: [
              Icon(Icons.fiber_manual_record,color: Colors.red,size: 10,),
              SizedBox(width: 7,),
              Text("Pond Camera View",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.7),
                ),
              )
            ],
          )
        ],
      ),
      actions: [
        Container(
          height: 22.55,
          width: 44.31,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Text("LIVE",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        )
      ],

    );
  }
}
