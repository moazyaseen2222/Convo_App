part of 'set_profile_cubit.dart';

abstract class SetProfileState {}

class SetProfileInitial extends SetProfileState {}

class SetProfileLoading extends SetProfileState {}

class SetProfileSuccess extends SetProfileState {}

class SetProfileError extends SetProfileState {
  final String message;

  SetProfileError(this.message);
}
