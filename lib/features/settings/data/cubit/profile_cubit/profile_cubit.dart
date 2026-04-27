import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final ImagePicker picker= ImagePicker();
  Future<void> pickFromCamera()async{
    emit(ProfileImageLoading());
    final picked = await picker.pickImage(source: ImageSource.camera);
    emit(ProfileImageSuccess(image: File(picked!.path)));
  }
  Future<void> pickFromGallery()async{
    emit(ProfileImageLoading());
    final picked = await picker.pickImage(source: ImageSource.gallery);
    emit(ProfileImageSuccess(image: File(picked!.path)));
  }
}
