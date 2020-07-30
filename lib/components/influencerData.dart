import 'dart:convert';
import 'package:http/http.dart' as http;
import 'influencer.dart';

String api = 'https://randomuser.me/api/';


List<Influencer> influencerAccounts = List<Influencer>();

Future<List<Influencer>> getInfluencerAccounts() async {

  for (int i = 0; i < random.nextInt(10); i++) {
    try{
      final response = await http.get(api);
      var responseJson = json.decode(response.body);
      if(responseJson != null){
        responseJson = responseJson['results'][0];
        influencerAccounts.add(Influencer.fromJson(responseJson));
      }
    }catch(e){print(e);}
  }
  return influencerAccounts;
}