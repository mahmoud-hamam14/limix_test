import 'package:dio/dio.dart';

import 'fish_recommendation_model.dart';

class FishData {

  static final Dio dio = Dio();

  static Future<FishRecommendationModel>
  getData() async {

    var repo = await dio.get(
      'https://fish-type-29031828413.europe-west3.run.app/classify',
    );

    print(repo.data);

    return FishRecommendationModel
        .fromJson(repo.data);
  }
}