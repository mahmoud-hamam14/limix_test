import 'package:flutter/material.dart';
class CustomSettingContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;
  final EdgeInsets? titlePadding;

  const CustomSettingContainer({
    super.key,
    required this.title,
     this.subtitle,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
    required this.iconColor,
     this.titlePadding,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          height: 70.5,
          width: 365,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
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
        )
        ],
          border: Border(
              top: BorderSide(
                  color: Color(0xFFF3F4F6),
                  width: 1.27
              )
          ),
        ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor,
                  shape: BoxShape.rectangle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 22,
                ),
              ),
              SizedBox(width: 18,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Padding(
              padding: titlePadding ?? EdgeInsets.zero,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xff101828),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
                  SizedBox(height: 2,),
                  Text(
                      subtitle!=null? subtitle! : '',
                      style: TextStyle(
                          color: Color(0xff6A7282),
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      )
                  )
                ],
              ),
              Spacer(),
              IconButton(
              onPressed: onTap
              , icon: Icon(Icons.arrow_forward_ios,color: Color(0xff99A1AF),size: 16,))
            ],
          ),
        ),

        ),
      ),
    );
  }
}
