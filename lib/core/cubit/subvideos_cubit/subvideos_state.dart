part of 'subvideos_cubit.dart';

@immutable
sealed class SubvideosState {}

final class SubvideosInitial extends SubvideosState {}

final class SubVideosSuccess extends SubvideosState {
  final VideoModel subVideos;

  SubVideosSuccess({required this.subVideos});
}

final class SubVideosLoading extends SubvideosState {}

final class SubVideosFailure extends SubvideosState {
  final String message;

  SubVideosFailure({required this.message});
}
