import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(12.radius),

        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.radius),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffF0FDFA), Color(0xffF0FDFA)],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: -2,
            ),
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -1,
            ),
          ],
          border: Border(
            top: BorderSide(color: Color(0xFFF3F4F6), width: 1.27),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.radius),
                  decoration: BoxDecoration(
                    color: Color(0xFFCBFBF1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.email_outlined,
                    color: Color(0xff009689),
                    size: 20.radius,
                  ),
                ),
                SizedBox(width: 15.width),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email Us',
                      style: TextStyle(
                        color: Color(0xff4A5565),
                        fontSize: 14.font,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 2.height),

                    Text(
                      'support@limix.eg',
                      style: TextStyle(
                        color: Color(0xff101828),
                        fontSize: 14.font,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.height),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.radius),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.radius),
                    color: Color(0xFFDBEAFE),

                    shape: BoxShape.rectangle,
                  ),
                  child: Icon(
                    Icons.phone_outlined,
                    color: Color(0xff155DFC),
                    size: 20.radius,
                  ),
                ),
                SizedBox(width: 15.width),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Call Us',
                      style: TextStyle(
                        color: Color(0xff4A5565),
                        fontSize: 14.font,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 2.height),
                    Text(
                      '+20 123 456 7890',
                      style: TextStyle(
                        color: Color(0xff101828),
                        fontSize: 14.font,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.height),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.radius),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.radius),
                    color: Color(0xFFDCFCE7),
                    shape: BoxShape.rectangle,
                  ),
                  child: Icon(
                    Icons.sports_volleyball_outlined,
                    color: Color(0xff00A63E),
                    size: 20.radius,
                  ),
                ),
                SizedBox(width: 15.width),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Visit Website',
                      style: TextStyle(
                        color: Color(0xff4A5565),
                        fontSize: 14.font,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 2.height),
                    Text(
                      'www.limix.eg',
                      style: TextStyle(
                        color: Color(0xff101828),
                        fontSize: 14.font,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Divider(height: 50.height, color: Color(0xFFEEEEEE), thickness: 2),

            Text(
              "Cairo, Egypt",
              style: TextStyle(
                color: Color(0xff4A5565),
                fontSize: 18.font,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
