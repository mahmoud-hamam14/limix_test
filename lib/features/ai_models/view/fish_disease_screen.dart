import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              decoration: BoxDecoration(

                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff224B8F),
                      Color(0xff3A6BC1)
                    ],
                ),
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

              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Title Bar
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fish Disease Detection',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'AI-powered health monitoring',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Stats Card
                    Container(
                      height: 110,
                      width: 336.01,

                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Infected Fish',
                                style: TextStyle(
                                  color: Color(0xff4A5565),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                             // SizedBox(height: 2),
                              Text(
                                '$infectedCount',
                                style: TextStyle(
                                  color: Color(0xffE7000B),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 60,
                            color: Colors.grey[300],
                          ),
                          Column(
                            children: [
                              Text(
                                'Fresh Fish',
                                style: TextStyle(
                                  color: Color(0xff4A5565),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '$freshCount',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

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