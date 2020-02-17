import 'package:iamflutter/apiproviders/githubDevelopers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:iamflutter/models/github-model.dart';


class ResultProfileList extends StatefulWidget {
  ResultProfileList({Key key}) : super(key: key);

  @override
  _ResultProfileListState createState() => _ResultProfileListState();
}

class _ResultProfileListState extends State<ResultProfileList> {



  @override
  void initState() {
    super.initState();
    loadTopFlutterProfileList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Great Flutter Developers"),
        ),
        body: Center(
          child: FutureBuilder(
            future: loadTopFlutterProfileList(),
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
  final SearchResultItem item;

  const _SearchResultItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12)
      ),
      child: ListTile(
        trailing: CircleAvatar(
          child: Image.network(item.owner.avatarUrl),
        ),
        title: Text(
          item.owner.login,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onTap: () async {
          if (await canLaunch(item.owner.htmlUrl)) {
            await launch(item.owner.htmlUrl);
          }
        },
      ),
    );
  }
}
