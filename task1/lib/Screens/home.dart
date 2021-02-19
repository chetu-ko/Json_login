import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:task1/widgets/getpathwidget.dart';
import 'package:task1/widgets/gettitlewidget.dart';

import 'package:task1/models/model.dart';

Future<List<Paths>> fetchPhotos() async {
  final response = await http
      .get('https://5d55541936ad770014ccdf2d.mockapi.io/api/v1/paths');
  return parsePaths(response.body);
}

// A function that converts a response body into a List<Paths>.
List<Paths> parsePaths(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  final parsed4 = parsed.sublist(0, 15);
  return parsed4.map<Paths>((json) => Paths.fromJson(json)).toList();
}

class MyHomePage extends StatelessWidget {
  //final String title;

  //MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Dogs path',
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder<List<Paths>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PathsList(paths: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PathsList extends StatelessWidget {
  final List<Paths> paths;
  final List<SubPath> subpaths;

  PathsList({Key key, this.paths, this.subpaths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: paths.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(0),
              width: 100,
              height: 300,
              child: Card(
                color: Colors.black,
                child: Column(
                  children: [
                    Text(paths[index].title,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 200.0,
                      child: getpathWidgets(paths[index].subPath),
                    ),
                    SizedBox(
                      height: 50.0,
                      child: getTitleWidgets(paths[index].subPath),
                    ),
                  ],
                ),
              ));
        });
  }
}
