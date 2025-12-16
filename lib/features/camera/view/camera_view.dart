import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:limix_test/features/camera/widget/appbar_camera.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {

  final String cameraUrl = "http://192.168.1.183:8080/video";

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                RotatedBox(
                  quarterTurns: 1,
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
             // const SizedBox(height: 15),
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

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
