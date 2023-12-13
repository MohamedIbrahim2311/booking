// import 'dart:convert';
// import 'package:booking1/bookingScreens/active_Screen.dart';
// import 'package:booking1/models/active.dart';
// import 'package:http/http.dart' as http;
//
// class ActiveApi {
//   static Future<List<Recipe>> getRecipe() async {
//     var uri = Uri.https(
//         'yummly2.p.rapidapi.com', '/feeds/list', {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
//
//     try {
//       final response = await http.get(uri, headers: {
//         "x-rapidapi-key": "YOUR API KEY FROM YUMMLY API",
//         "x-rapidapi-host": "yummly2.p.rapidapi.com",
//         "useQueryString": "true"
//       });
//
//       if (response.statusCode == 200) {
//         Map data = jsonDecode(response.body);
//         List _temp = [];
//
//         for (var i in data['feed']) {
//           _temp.add(i['content']['details']);
//         }
//
//         return Recipe.recipesFromSnapshot(_temp);
//       } else {
//         // If the response status code is not 200, print the status code and body
//         print('Failed to load recipes. Status Code: ${response.statusCode}, Body: ${response.body}');
//         throw Exception('Failed to load recipes');
//       }
//     } catch (e) {
//       // Print the detailed error message
//       print('Error fetching recipes: $e');
//       throw Exception('Failed to load recipes');
//     }
//   }
// }
