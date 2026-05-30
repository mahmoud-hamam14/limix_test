import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/features/settings/data/cubit/profile_cubit/profile_cubit.dart';
import 'package:limix_test/features/settings/widget/profile_widgets/image_picker_bottom_sheet.dart';
class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileState>(builder: (context, state) {
      File? imageFile;
      if(state is ProfileImageSuccess){
        imageFile=state.image;
      }
      return Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 58,
              backgroundColor: Colors.white,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff01378E),
                      Color(0xff2563EB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: imageFile != null
                      ? DecorationImage(image: FileImage(imageFile!), fit: BoxFit.cover)
                      : null,
                ),
                child: imageFile == null
                    ? Center(child: Text("AM", style: TextStyle(color: Colors.white, fontSize: 28)))
                    : null,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => ShowImagePickerSheet(context),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xff01378E),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xff01378E),
                    child: Icon(Icons.camera_alt_outlined, size: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )
      );

      },

  );
  }
}
