import 'package:flutter/material.dart';
import 'package:iamflutter/pages/homepage.dart';
import 'package:iamflutter/pages/resultNewsList.dart';
import 'package:iamflutter/pages/resultProfileList.dart';
import 'package:iamflutter/pages/resultRepoList.dart';
import 'package:iamflutter/pages/resultYoutubeList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iamFlutter',
      initialRoute: '/',
      routes: {
      '/': (context) => Homepage(),
      '/repos': (context) => ResultRepoList(),
      '/profiles': (context) => ResultProfileList(),
      '/news': (context) => ResultNewsList(),
      '/youtube': (context) => ResultYoutubeList()
    },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

