import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/cubit/profile_cubit/profile_cubit.dart';
import '../view/account_setting_screen.dart';
class AcountSettingWidget extends StatelessWidget {
  const AcountSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 45),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

          height: 70.5,
            width: 328.39,
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
          child:Material(
          color: Colors.transparent,
         child: InkWell(
          onTap: (){
            final profileCubit = context.read<ProfileCubit>();

            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                value: profileCubit,
                child: AccountSettingScreen(),
            ),
            ),
                );
          },
          child:
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFDBEAFE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xff155DFC),
                  size: 22,
                ),
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Settings',
                    style: TextStyle(
                      color: Color(0xff101828),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter'
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    'Email, password, security',
                    style: TextStyle(
                      color: Color(0xff6A7282),
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                    )
                  )
                ],
              ),
              Spacer(),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingScreen(),));
              }, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff99A1AF),size: 16,))
            ]
          )
        ),
      )
          )
      );
  }
}
