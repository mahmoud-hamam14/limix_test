import 'package:flutter/material.dart';

import '../../../../camera/view/camera_view.dart';

class AppBarHomeView extends StatelessWidget {
  const AppBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff01378E),
                  Color(0xff2563EB),
                ]),
                //color: gradient == null ? backgroundColor : null,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 6,
                      spreadRadius: -4,
                      color: Color(0x1A000000)
                  ),
                  BoxShadow(
                      offset: Offset(0 ,10),
                      blurRadius:15,
                      spreadRadius: -3,
                      color: Color(0x1A000000)
                  )
                ]
            )
        ),
      elevation: 1,
      titleSpacing: 10,
      title: Row(
        children: [
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Limix',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Smart Aquaculture',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraView()),
            );
          },
          icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, color: Colors.white),
            ),
            Positioned(
              right: 5,
              top: 2,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
