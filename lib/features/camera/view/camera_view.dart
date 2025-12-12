import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:limix_test/features/camera/widget/appbar_camera.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {

  final String cameraUrl = "http://192.168.1.3:8080/video";

  bool isRunning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const AppbarCamera(),
      ),
      body: Container(
        height: 851.48,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              const Color(0xff1C398E).withOpacity(0.5),
              const Color(0xff005F5A).withOpacity(0.5),
              const Color(0xff0D542B).withOpacity(0.5),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                height: 400,
                width: double.infinity,
                child: RotatedBox(
                  quarterTurns: 4,
                  child: Mjpeg(
                    isLive: isRunning,
                    stream: cameraUrl,
                    error: (context, error, stack) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.broken_image, color: Colors.red, size: 50),
                        ],
                      );
                    },
                    loading: (context) => const Center(
                      child: CircularProgressIndicator(color: Colors.pink),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text("Camera Feed",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.5),
                  )),
              const SizedBox(height: 8),
              Text("Live view from pond camera",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.5),
                  )),
              const SizedBox(height: 21.5),

              Container(
                height: 98.5,
                width: 336,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                isRunning = !isRunning;
                              });
                            },
                            icon: Icon(
                              isRunning ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ))),
                    const SizedBox(width: 65),
                    Container(
                      height: 63.9,
                      width: 63.9,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                        onPressed: () {

                          setState(() {
                            isRunning = false;
                          });
                          Future.delayed(const Duration(milliseconds: 200), (){
                            setState(() {
                              isRunning = true;
                            });
                          });
                        },
                        icon: const Icon(Icons.refresh,
                            color: Colors.white, size: 30)),
                  ],
                ),
              ),
              const SizedBox(height: 12),


              Container(
                height: 48,
                width: 336,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xffAD46FF), Color(0xffF6339A)]),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 6,
                          spreadRadius: -4,
                          color: Color(0x1A000000)),
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: -3,
                          color: Color(0x1A000000))
                    ]),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.psychology, color: Colors.white, size: 28),
                      SizedBox(width: 10),
                      Text(
                        "Analyze with AI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
