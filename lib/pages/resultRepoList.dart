import 'package:iamflutter/apiproviders/githubProjects.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:iamflutter/models/github-model.dart';


class ResultRepoList extends StatefulWidget {
  ResultRepoList({Key key}) : super(key: key);

  @override
  _ResultRepoListState createState() => _ResultRepoListState();
}

class _ResultRepoListState extends State<ResultRepoList> {



  @override
  void initState() {
    super.initState();
    loadTopFlutterReposList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Awesome Flutter Projects"),
        ),
        body: Center(
          child: FutureBuilder(
            future: loadTopFlutterReposList(),
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
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(item.owner.avatarUrl),
        ),
        title: Text(
          item.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow),
            Text('${item.stars}')
          ],
        ),
        onTap: () async {
          if (await canLaunch(item.htmlUrl)) {
            await launch(item.htmlUrl);
          }
        },
      ),
    );
  }
}
