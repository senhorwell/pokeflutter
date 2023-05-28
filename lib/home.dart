import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future? loadPokedex() async {
    try {
      var response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0'),
      );

      var responseJson = jsonDecode(response.body);
      print(responseJson);
      return responseJson;
    } catch (e) {
      throw e.toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PokeFlutter"),
      ),
      body: FutureBuilder(
        future: loadPokedex(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: LoadingAnimationWidget.beat(
                size: 200,
                color: Colors.red
              )
            );
          }
          return Center(
            child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          Text(snapshot.data[index]["name"])
                        ]
                      )
                    );
                  },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
