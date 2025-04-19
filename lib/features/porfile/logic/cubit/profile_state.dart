part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSucess extends ProfileState {}

final class ProfilError extends ProfileState {
  final String message;

  ProfilError(this.message);
}
