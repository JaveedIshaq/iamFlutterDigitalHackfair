import 'package:iamflutter/apiproviders/redditnews.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:iamflutter/models/reddit-flutter-news-model.dart';


class ResultNewsList extends StatefulWidget {
  ResultNewsList({Key key}) : super(key: key);

  @override
  _ResultNewsListState createState() => _ResultNewsListState();
}

class _ResultNewsListState extends State<ResultNewsList> {

   final RedditClient client = new RedditClient();

  @override
  void initState() {
    super.initState();
    client.getArticles(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter articles on Reddit"),
        ),
        body: Center(
          child: FutureBuilder(
            future: client.getArticles(10),
            builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  
                return Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 15.0),
                          CircularProgressIndicator(),
                          SizedBox(height: 10.0),
                          Text("Loading"),
                          SizedBox(height: 15.0),
                        ],
                      ),
                    );
              } else {
              return SafeArea(
                    child: Container(
                    height: 650.0,
                    child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                        return _SearchResultItem(item: snapshot.data[index]);
                      },
                              ),
                ),
              );
              }
            })
        ),
      );
  }
}



class _SearchResultItem extends StatelessWidget {
  final Article item;

  const _SearchResultItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('item $item');
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: _thumbnail(item.thumbnail),
      ),
      title: Text(
        item.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      subtitle: Text(item.author),
      dense: true,
      onTap: () async {
        if (await canLaunch(item.url)) {
          await launch(item.url);
        }
      },
    );
  }

  Widget _thumbnail(String url) {
    if (url.contains('http')) {
      return Image.network(url);
    }
    return Image.network(
        'https://logodix.com/logo/576948.png');
  }
}
