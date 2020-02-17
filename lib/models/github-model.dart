class SearchResult {
  final List<SearchResultItem> items;

  const SearchResult({this.items});

  static SearchResult fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((dynamic item) =>
            SearchResultItem.fromJson(item as Map<String, dynamic>))
        .toList();
    return SearchResult(items: items);
  }
}


class SearchResultItem {
  final String fullName;
  final String name;
  final String description;
  final String htmlUrl;
  final int stars;
  final GithubUser owner;

  const SearchResultItem(
      {this.fullName, this.name, this.description, this.htmlUrl, this.owner, this.stars});

  static SearchResultItem fromJson(dynamic json) {
    return SearchResultItem(
      fullName: json['full_name'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      htmlUrl: json['html_url'] as String,
      stars: json['stargazers_count'],
      owner: GithubUser.fromJson(json['owner']),
    );
  }
}



class GithubUser {
  final String login;
  final String avatarUrl;
  final String url;
  final String htmlUrl;

  const GithubUser({this.login, this.avatarUrl, this.url, this.htmlUrl});

  static GithubUser fromJson(dynamic json) {
    return GithubUser(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
    );
  }
}
