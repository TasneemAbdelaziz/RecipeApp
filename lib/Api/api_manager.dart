import 'dart:convert';
import 'package:final_project/Api/api_constants.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:http/http.dart' as http;


class ApiManager{

  static Future<RandomRecipeResponse?> getRandomRecipe() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.randomRecipeApi,
        {
          "apiKey": "73f34b466856436e978b5cc90412f0d0",
          "number":"100"
        });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RandomRecipeResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}