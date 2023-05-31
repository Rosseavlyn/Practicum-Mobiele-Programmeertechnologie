import '../service/base_network.dart';

class MealSource {
  static MealSource instance = MealSource();
  Future<Map<String, dynamic>> loadMeal(String text) {
    return BaseNetwork.get(text);
  }
}
