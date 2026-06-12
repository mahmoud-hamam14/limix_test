import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

import '../../camera/view/camera_view.dart';

class AppBarHomeView extends StatelessWidget {
  const AppBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff01378E), Color(0xff2563EB)],
          ),
          //color: gradient == null ? backgroundColor : null,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -4,
              color: Color(0x1A000000),
            ),
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 15,
              spreadRadius: -3,
              color: Color(0x1A000000),
            ),
          ],
        ),
      ),
      elevation: 1,
      titleSpacing: 10,
      title: Row(
        children: [
          SizedBox(width: 12.width),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Limix',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.font,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Smart Aquaculture System',
                style: TextStyle(color: Colors.white70, fontSize: 14.font),
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
          icon: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 20.radius,
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 20.radius,
              ),
            ),
            Positioned(
              right: 5.radius,
              top: 2.radius,
              child: Container(
                padding: EdgeInsets.all(4.radius),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.font,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 6.radius),
      ],
    );
  }
}
