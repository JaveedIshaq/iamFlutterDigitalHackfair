import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iamflutter/models/reddit-flutter-news-model.dart';

class RedditClient {
  final String baseUrl;
  final http.Client httpClient;
  final String url = "https://www.reddit.com/r/flutterdev/hot/.json";

  RedditClient({
    http.Client httpClient,
    this.baseUrl = "https://www.reddit.com/r/flutterdev/hot/.json",
  }) : this.httpClient = httpClient ?? http.Client();

  Future getArticles(int count) async {
    print('GET $baseUrl?count=$count');
    final response = await httpClient.get(Uri.parse("$baseUrl?count=$count"));
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      var result = NewsSearchResult.fromJson(results);

      print(result.items);
      return result.items;
    } else {
      throw SearchResultError();
    }
  }
}