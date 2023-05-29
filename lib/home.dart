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
  late List pokemons;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  loadPokedex() async {
    try {
      var response = await http.get(
        Uri.parse('https://www.pokemon.com/us/api/pokedex/kalos'),
        headers: {
          "content-type": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, HEAD"
        },
      );
      var responseJson = jsonDecode(response.body);
      pokemons = responseJson;
      return responseJson;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "PokeFlutter",
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: loadPokedex(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: LoadingAnimationWidget.beat(
                      size: 200, color: Colors.red));
            }
            return Center(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 2),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(children: [
                        Text(pokemons[index]["ThumbnailAltText"])
                      ]),
                    )),
                  );
                },
              ),
            );
          },
        ));
  }
}
