import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'http_override.dart';

String basicAuth =
    'Basic ${base64.encode(utf8.encode('elastic:-0He3dSlA*z7Pw+Irc+c'))}';
String country_name= "Turkey";
TextEditingController _city = TextEditingController();

class SearchByCountry extends StatefulWidget {
  const SearchByCountry({Key? key,}) : super(key: key);
  @override
  State<SearchByCountry> createState() => _SearchByCountryState();
}
class _SearchByCountryState extends State<SearchByCountry> {

  Future<Map<String,dynamic>> fetchAlbum() async {
    HttpOverrides.global = MyHttpOverrides();
    final response = await http.get(
      Uri.parse('https://10.0.2.2:9200/datacity/_search?size=100&q=%20+country_name:($country_name)'),
      headers: {
        HttpHeaders.authorizationHeader: basicAuth,
      },
    );
    final responseJson = jsonDecode(response.body);
    return responseJson;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
          title:const Text("DataCity-country_test")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width*0.95,
              margin: const EdgeInsets.only(top: 10,bottom: 10),
              child: TextField(
                controller: _city,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(onPressed:(){
                      setState((){
                        country_name = _city.text;
                      });
                    },
                        icon: const Icon(Icons.search,color: Colors.blue,))
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchAlbum(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String,dynamic>? data = snapshot.data as Map<String,dynamic>?;
                    return ListView.builder(
                        itemCount: data!["hits"]["hits"].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(top: 5,bottom: 5),
                            color: Colors.white,
                            child: TextButton(
                              onPressed: () {
                              },
                              child: Center(
                                child: Text(
                                  data["hits"]["hits"][index]["_source"]["name"] + "/" + data["hits"]["hits"][index]["_source"]["state_name"],textScaleFactor: 1.3,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
