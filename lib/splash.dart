import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:limix_test/features/auth/view/login_view.dart'; // عشان التايمر للنقل للصفحة اللي بعدها

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 1. إعداد الأنيميشن (عشان اللوجو يظهر بـ Fade و Scale)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // مدة ظهور اللوجو
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    // تشغيل الأنيميشن
    _controller.forward();

    // 2. الانتقال للصفحة التالية بعد وقت معين (مثلاً 4 ثواني)
    Timer(const Duration(seconds: 4), () {
      // هنا حط كود الانتقال لصفحة الـ Login أو Home
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
     
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Color mainColor = const Color(0xFF0D6878);
    final Color lightCircleColor = const Color(0xFF00B8DB).withOpacity(0.1);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color(0xFFFFFFFF),
         Color(0xFFECFEFF),
        ]
      ),
      ),

     child:  Scaffold(

       backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -80,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightCircleColor,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightCircleColor,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                        'assets/images/n_logo.png',
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        SvgPicture.asset(

                            'assets/images/n_logo.png',
                          width: 400,


                          ),

                      
                        const SizedBox(height: 10),
                        // النص تحت اللوجو
                         Text(
                          "Smart Aquaculture System",
                          style: TextStyle(
                            color: Color(0xff45556C),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height:10), // مسافة بين اللوجو والتحميل

                // --- 4. أنيميشن التحميل (النقط) ---
                SpinKitThreeBounce(
                  color: const Color(0xFF0092B8), // لون النقط (تركواز)
                  size: 30.0,
                ),
              ],
            ),
          ),

          // --- 5. النص اللي تحت خالص (Footer) ---
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Made for Egypt's Aquaculture Industry",
                style: TextStyle(
                  color: Color(0xff62748E),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}