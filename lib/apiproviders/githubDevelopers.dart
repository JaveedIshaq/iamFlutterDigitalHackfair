import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iamflutter/models/github-model.dart';

final String url = "https://api.github.com/search/repositories?q=topic:flutter&sort=stars&order=desc";

Future loadTopFlutterProfileList() async {
   final response =
      await http.get(url);

  if (response.statusCode == 200) { 
    final jsonResponse = jsonDecode(response.body);
    SearchResult topFlutterRepos = SearchResult.fromJson(jsonResponse);
    return topFlutterRepos.items;

  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}