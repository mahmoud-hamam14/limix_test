import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

import '../../../core/constants/custom_appbar.dart';

class FishDiseaseScreen extends StatefulWidget {
  const FishDiseaseScreen({super.key});

  @override
  _FishDiseaseScreenState createState() => _FishDiseaseScreenState();
}

class _FishDiseaseScreenState extends State<FishDiseaseScreen> {
  int infectedCount = 3;
  int freshCount = 3;
  String selectedTab = 'infected';

  final List<Map<String, String>> infectedFish = [
    {'image': 'assets/fish1.jpg', 'title': 'Infected Shrimp'},
    {
      'image': 'assets/images/ImageWithFallback.png',
      'title': 'Infected Puffer Fish',
    },
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          title: 'Fish Disease Detection',
          subTitle: 'AI-powered health monitoring',
          showBackButton: false,
          onTap: () {},

          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.width),
          child: Column(
            children: [
              SizedBox(height: 20.height),

              // Tab Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedTab = 'infected';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            selectedTab == 'infected'
                                ? Colors.red
                                : Colors.white,
                        foregroundColor:
                            selectedTab == 'infected'
                                ? Colors.white
                                : Colors.grey[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Infected Fish',
                        style: TextStyle(
                          fontSize: 14.font,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.width),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedTab = 'fresh';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            selectedTab == 'fresh'
                                ? Colors.green
                                : Colors.white,
                        foregroundColor:
                            selectedTab == 'fresh'
                                ? Colors.white
                                : Colors.grey[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.radius),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Fresh Fish',
                        style: TextStyle(
                          fontSize: 14.font,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.height),

              // Content List
              Expanded(
                child: ListView.builder(
                  itemCount:
                      selectedTab == 'infected'
                          ? infectedFish.length
                          : freshFish.length,
                  itemBuilder: (context, index) {
                    final imagePath =
                        selectedTab == 'infected'
                            ? infectedFish[index]['image']! // مجرد String
                            : freshFish[index]['image']!;

                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.height),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.radius),
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
                              height: 180.height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.radius),
                                  bottom: Radius.circular(20.radius),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue[100]!,
                                    Colors.green[100]!,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                            ),
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
      ),

      // Floating Action Button
    );
  }
}
