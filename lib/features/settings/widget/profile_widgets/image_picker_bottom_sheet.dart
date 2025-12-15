
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/features/settings/data/cubit/profile_cubit/profile_cubit.dart';
void ShowImagePickerSheet(BuildContext context){
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18))
      ),
      builder: (_){
        return Padding(padding:
        const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt_outlined),
                title: Text("Take a photo"),
                onTap: (){
                  context.read<ProfileCubit>().pickFromCamera();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Choose from gallery"),
                onTap: (){
                  context.read<ProfileCubit>().pickFromGallery();
                  Navigator.pop(context);
                }
              )
            ]
          ),
        );
}  );
}