part of 'fish_recommendation_cubit.dart';


sealed class FishRecommendationState {}

final class FishRecommendationInitial extends FishRecommendationState {}
final class FishRecommendationLoading extends FishRecommendationState {}
final class FishRecommendationSuccess extends FishRecommendationState {}
final class FishRecommendationError extends FishRecommendationState {}
