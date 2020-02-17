class Youtuber {
  int totalCount;
  bool incompleteResults;
  List<Items> items;

  Youtuber({this.totalCount, this.incompleteResults, this.items});

  Youtuber.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['incomplete_results'] = this.incompleteResults;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String title;
  String description;
  String channelId;
  String thumbnailUrl;

  Items({this.title, this.description, this.channelId, this.thumbnailUrl});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    channelId = json['channelId'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['channelId'] = this.channelId;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}