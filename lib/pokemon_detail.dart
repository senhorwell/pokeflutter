import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'loading_icon.dart';

// ignore: must_be_immutable
class PokemonDetailPage extends StatefulWidget {
  late String id;

  PokemonDetailPage({required this.id, super.key});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class Pokemon {
  late String id;
  late String name;
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  var pokemon;

  late List doubleDamageFrom = [];
  late List doubleDamageTo = [];
  late List halfDamageFrom = [];
  late List halfDamageTo = [];
  late List noDamageFrom = [];
  late List noDamageTo = [];

  bool initialized = false;

  loadPokemon(id) async {
    try {
      var response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'),
      );

      var responseJson = jsonDecode(response.body);
      pokemon = responseJson;

      for (int i = 0; i < pokemon["types"].length; i++) {
        var response = await http.get(
          Uri.parse(pokemon["types"][i]["type"]["url"]),
        );

        responseJson = jsonDecode(response.body);
        for (int j = 0;
            j < responseJson["damage_relations"]["double_damage_from"].length;
            j++) {
          doubleDamageFrom
              .add(responseJson["damage_relations"]["double_damage_from"][j]);
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["double_damage_to"].length;
            j++) {
          doubleDamageTo
              .add(responseJson["damage_relations"]["double_damage_to"][j]);
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["half_damage_from"].length;
            j++) {
          halfDamageFrom
              .add(responseJson["damage_relations"]["half_damage_from"][j]);
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["half_damage_to"].length;
            j++) {
          halfDamageTo
              .add(responseJson["damage_relations"]["half_damage_to"][j]);
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["no_damage_from"].length;
            j++) {
          noDamageFrom
              .add(responseJson["damage_relations"]["no_damage_from"][j]);
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["no_damage_to"].length;
            j++) {
          noDamageTo.add(responseJson["damage_relations"]["no_damage_to"][j]);
        }
      }
      return responseJson;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(110, 119, 117, 117),
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/pokeball.png',
                width: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "PokeFlutter",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: loadPokemon(widget.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: LoadingIcon(
                loadingFormat: LoadingFormat.Pokeball,
                size: 100.0,
                speed: 4.0,
              ));
            }
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.id}.png',
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Expanded(
                          child: Image.asset(
                            'assets/pokeball.png',
                            width: 20,
                            height: 20,
                          ),
                        );
                      },
                    ),
                    Text(
                      pokemon["name"],
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Defesa",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                          ),
                          doubleDamageFrom.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text("Dano duplo"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: doubleDamageFrom.length * 20,
                                        child: ListView.builder(
                                            itemCount: doubleDamageFrom.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                  child: Text(
                                                      "${doubleDamageFrom[index]["name"]}"));
                                            }),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          halfDamageFrom.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text("Dano reduzido"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: halfDamageFrom.length * 20,
                                        child: ListView.builder(
                                            itemCount: halfDamageFrom.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                  child: Text(
                                                      "${halfDamageFrom[index]["name"]}"));
                                            }),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          noDamageFrom.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text("Sem dano"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: noDamageFrom.length * 20,
                                        child: ListView.builder(
                                            itemCount: noDamageFrom.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                  child: Text(
                                                      "${noDamageFrom[index]["name"]}"));
                                            }),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                        ]),
                        Column(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Ataque",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                          doubleDamageTo.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text("Dano duplo"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: doubleDamageTo.length * 20,
                                        child: ListView.builder(
                                            itemCount: doubleDamageTo.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                  child: Text(
                                                      "${doubleDamageTo[index]["name"]}"));
                                            }),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          halfDamageTo.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text("Dano reduzido"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: halfDamageTo.length * 20,
                                        child: ListView.builder(
                                            itemCount: halfDamageTo.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                  child: Text(
                                                      "${halfDamageTo[index]["name"]}"));
                                            }),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          noDamageTo.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text("Sem dano"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: noDamageTo.length * 20,
                                        child: ListView.builder(
                                            itemCount: noDamageTo.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                  child: Text(
                                                      "${noDamageTo[index]["name"]}"));
                                            }),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
