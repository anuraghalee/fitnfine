import 'dart:convert';

import 'package:fitness_app/model/model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class APIservice {
  Future<List<dynamic>> getIngredientCategories() async {
    var url = 'https://www.themealdb.com/api/json/v1/1/list.php?c=list';

    print('CALL');

    var list = [];

    var response = await get(Uri.parse(url));
    var data = jsonDecode(response.body);

    for (var i in data['meals']) {
      list.add(i);
    }

    return list;
  }

  Future<List<dynamic>> getCategoryRecipes(String cat) async {
    var url = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=$cat';

    print('API CALL');

    var rList = [];

    var response = await get(Uri.parse(url));

    var data = jsonDecode(response.body);

    for (var a in data['meals']) {
      rList.add(a);
    }

    return rList;
  }

  Future<List<PilatesInfo>> getPilatesInfo() async {
    var response = await rootBundle.loadString('json/pilates.json');
    List<PilatesInfo> pList = [];
    var data = jsonDecode(response);

    for (var i in data) {
      pList.add(PilatesInfo.fromJson(i));
    }

    return pList;
  }

  Future<List<StretchingInfo>> getStretchingInfo() async {
    var response = await rootBundle.loadString('json/stretching.json');
    List<StretchingInfo> sList = [];
    var data = jsonDecode(response);

    for (var i in data) {
      sList.add(StretchingInfo.fromJson(i));
    }

    return sList;
  }

  Future<List<CrossfitInfo>> getCrossfitInfo() async {
    var response = await rootBundle.loadString('json/crossfit.json');
    List<CrossfitInfo> cList = [];
    var data = jsonDecode(response);

    for (var i in data) {
      cList.add(CrossfitInfo.fromJson(i));
    }

    return cList;
  }

  Future<dynamic> getExercise() async {
    var url = 'https://exercisedb.p.rapidapi.com/exercises?limit=600';

    var wList = [];

    print("HELLO");

    var response = await get(
      Uri.parse(url),
      headers: {
        "X-RapidAPI-Key": "18c1f74cc5msh2a40a171f405106p169684jsnc52b7fb4ebc9",
        "X-RapidAPI-Host": "exercisedb.p.rapidapi.com",
      },
    );

    for (var a in jsonDecode(response.body)) {
      wList.add(a);
    }

    return wList;
  }

  Future<List<dynamic>> getVideo() async {
    var url = 'https://youtube-search-and-download.p.rapidapi.com/search';

    var yList = [];

    var respone = await get(
      Uri.parse(url).replace(
        queryParameters: {
          'query': 'Scissors Jump',
          'type': 'v',
          'duration': 's',
        },
      ),
      headers: {
        "X-RapidAPI-Key": "18c1f74cc5msh2a40a171f405106p169684jsnc52b7fb4ebc9",
        "X-RapidAPI-Host": "youtube-search-and-download.p.rapidapi.com",
      },
    );

    var data = jsonDecode(respone.body);

    var surl = data['contents'][0]['video']['thumbnails'][1]['url'];
    var yId = data['contents'][0]['video']['videoId'];

    yList.addAll([surl, yId]);

    return yList;
  }

  Future<List<YogaCategory>> getYoga() async {
    var url = 'https://yoga-api-nzy4.onrender.com/v1/categories';

    var response = await get(Uri.parse(url));

    var data = jsonDecode(response.body);

    List<YogaCategory> cList = [];

    for (var a in data) {
      cList.add(YogaCategory.fromJson(a));
    }

    return cList;
  }
}
