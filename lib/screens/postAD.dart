import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostAD extends StatefulWidget {
  @override
  _PostADState createState() => _PostADState();
}

class _PostADState extends State<PostAD> {
  final List<dynamic> loadedAds = [];
  var _isinit = true;
  var isLoading = false;
  @override
  Future<void> didChangeDependencies() async {
    if (_isinit) {
      setState(() {
        isLoading = true;
      });
      final url = 'https://adgram-7ff9f.firebaseio.com/advertisments.json';
      final response = await http.get(url);
      print(response.body);
      var data = json.decode(response.body);
      data.forEach((ad, adData) {
        loadedAds.add({
          'likes_needed': adData['likes_needed'].toString(),
          'average_bid': adData['average_bid'].toString(),
          'total_bid': adData['total_bid'].toString(),
          'description': adData['description'].toString(),
          'followers_needed': adData['followers_needed'].toString(),
          'image_url': adData['image_url'].toString(),
        });
      });
    }

    setState(() {
      isLoading = false;
    });
    _isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height:50),
        Expanded(
          child: ListView.builder(
            itemCount: loadedAds.length,
            itemBuilder: (ctx, i) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(45, 45, 45, 1)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 130.0,
                        width: 130.0,
                        child: Image.network(
                          loadedAds[i]['image_url'],
                          fit: BoxFit.contain,),
                      ),
                      Text(
                        'Influencer Needed:',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.grey.shade400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.account_circle, color: Colors.grey.shade400, size: 20.0,),
                          Text(loadedAds[i]['followers_needed'], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey.shade400),),
                          Icon(Icons.favorite, color: Colors.grey.shade400, size: 20.0,),
                          Text(loadedAds[i]['likes_needed'], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey.shade400),),
                        ],
                      )
                    ],
                  ),
                  Text(
                    loadedAds[i]['description'],
                    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400, color: Colors.grey.shade400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Total Bids:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400
                              ),
                            ),
                            Text(
                              loadedAds[i]['total_bid'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400
                              ),
                            )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Average Bids:',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400
                            ),
                          ),
                          Text(
                            loadedAds[i]['average_bid'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}