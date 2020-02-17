import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("I am Flutter",
        style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
              ),
              height: 80,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center, 
            children: <Widget>[
                  _buildCategoryItem("Awesome Projets", "projects","/repos"),
                  _buildCategoryItem("Great Developers", "developers", "/profiles"),
                  _buildCategoryItem("Flutter Reddit News", "news", "/news"),
                  _buildCategoryItem("Learning Resources", "learning", "/youtube"),
                  _buildCategoryItem("Flutter Community", "meetups", "/community"),
            ]
          )
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imageName, String route) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: MaterialButton(
        elevation: 10.0,
        highlightElevation: 1.0,
        //onPressed: () => _categoryPressedFunction(context,category),
         onPressed: () async {
          if(route == '/community'){

            if (await canLaunch('https://flutter.dev/community')) {
           await launch('https://flutter.dev/community');
           }

          }else{
            Navigator.pushNamed(context, route);
          }


          },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
        color: Colors.white,
        textColor: Colors.deepPurpleAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 5.0),
            Image.asset("assets/images/$imageName.png"),
            SizedBox(height: 5.0),
            Text(title),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}