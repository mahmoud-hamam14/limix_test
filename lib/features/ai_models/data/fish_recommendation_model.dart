class FishRecommendationModel {

  final String fishImage;
  final String fishName;

  FishRecommendationModel({
    required this.fishImage,
    required this.fishName,
  });

  factory FishRecommendationModel.fromJson(
      Map<String, dynamic> json) {
    print(json['fish_image']);
    print(json['fish_name']);

    return FishRecommendationModel(

      fishImage:
      json['fish_image']?.toString() ?? '',

      fishName:
      json['fish_name']?.toString() ?? '',

    );
  }
}