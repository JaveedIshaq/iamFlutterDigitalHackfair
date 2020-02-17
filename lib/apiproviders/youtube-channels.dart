import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iamflutter/models/youtuber.dart';

Future loadTopFlutterYoutubeChannelsList(BuildContext context) async {

   final jsonData = await DefaultAssetBundle.of(context).loadString('assets/json/youtuber.json');

  if (jsonData != null) { 
    final jsonResponse = jsonDecode(jsonData);
    print(jsonResponse);
    Youtuber topFlutterYoutubeChannels = Youtuber.fromJson(jsonResponse);

    print(topFlutterYoutubeChannels.items);

    return topFlutterYoutubeChannels.items;

  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}