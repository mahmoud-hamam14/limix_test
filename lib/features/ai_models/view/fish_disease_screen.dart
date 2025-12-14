import 'package:flutter/material.dart';

import '../../../core/constants/custom_appbar.dart';
class FishDiseaseScreen extends StatefulWidget {
  @override
  _FishDiseaseScreenState createState() => _FishDiseaseScreenState();
}

class _FishDiseaseScreenState extends State<FishDiseaseScreen> {
  int infectedCount = 3;
  int freshCount = 3;
  String selectedTab = 'infected';

  final List<Map<String, String>> infectedFish = [
    {'image': 'assets/fish1.jpg', 'title': 'Infected Shrimp'},
    {'image': 'assets/images/ImageWithFallback.png', 'title': 'Infected Puffer Fish'},
    {'image': 'assets/images/fish2.png', 'title': 'Infected Koi Fish'},
  ];

  final List<Map<String, String>> freshFish = [
    {'image': 'assets/images/fish3.png', 'title': 'Prepared Fish'},
    {'image': 'assets/images/fish4.png', 'title': 'Healthy Koi'},
    {'image': 'assets/images/fish5.png', 'title': 'Fresh White Fish'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            title: 'Fish Disease Detection',
            subTitle: 'AI-powered health monitoring',
            showBackButton: false,
            onTap: (){},
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff224B8F),
                  Color(0xff3A6BC1)
                ]
            ),
            iconTheme: IconThemeData(color: Colors.white),
          )
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),

            // Tab Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedTab = 'infected';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedTab == 'infected'
                            ? Colors.red
                            : Colors.white,
                        foregroundColor: selectedTab == 'infected'
                            ? Colors.white
                            : Colors.grey[700],
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Infected Fish',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedTab = 'fresh';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedTab == 'fresh'
                            ? Colors.green
                            : Colors.white,
                        foregroundColor: selectedTab == 'fresh'
                            ? Colors.white
                            : Colors.grey[700],
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Fresh Fish',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Content List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: selectedTab == 'infected'
                    ? infectedFish.length
                    : freshFish.length,
                itemBuilder: (context, index) {
                  final imagePath = selectedTab == 'infected'
                      ? infectedFish[index] ['image']!                     // مجرد String
                      : freshFish[index]['image']!;


                  return Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image placeholder
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                colors: [Colors.blue[100]!, Colors.green[100]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),

                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button

    );
  }
}