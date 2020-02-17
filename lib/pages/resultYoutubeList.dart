import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:iamflutter/models/youtuber.dart';
import 'package:iamflutter/apiproviders/youtube-channels.dart';



class ResultYoutubeList extends StatefulWidget {
  ResultYoutubeList({Key key}) : super(key: key);

  @override
  _ResultYoutubeListState createState() => _ResultYoutubeListState();
}

class _ResultYoutubeListState extends State<ResultYoutubeList> {



  @override
  void initState() {
    super.initState();
    loadTopFlutterYoutubeChannelsList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Youtube Channels"),
        ),
        body: Center(
          child: FutureBuilder(
            future:  loadTopFlutterYoutubeChannelsList(context),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              // Decode Json
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

                print(snapshot.data.length);

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
  final Items item;

  const _SearchResultItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(item.thumbnailUrl),
      ),
      title: Text(
        item.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
      subtitle: Text(
                    item.description.length < 100 ? item.description 
                    : "${item.description.substring(1,90)}..."
                    ),
      onTap: () async {
        if (await canLaunch(item.channelId)) {
          await launch(item.channelId);
        }
      },
    );
  }
}
