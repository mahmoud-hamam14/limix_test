part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileImageLoading extends ProfileState {}
final class ProfileImageSuccess extends ProfileState {
  final File image;
  ProfileImageSuccess({required this.image});

}
