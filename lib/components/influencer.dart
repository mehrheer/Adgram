import 'dart:math';

Random random = Random();
int next(int min, int max) => min + random.nextInt(max - min);

class Influencer{
  String username;
  String iconUrl;
  int posts;
  int followers;

  Influencer({this.username, this.iconUrl, this.followers, this.posts});

  factory Influencer.fromJson(var json){
    return Influencer(
      username: json['name']['first'] + '_' + json['name']['last'],
      posts: next(100, 1000),
      followers: next(50000, 10000000),
      iconUrl: json['picture']['medium'],
    );
  }
}