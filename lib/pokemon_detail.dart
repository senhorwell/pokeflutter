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

class Damage {
  late String name;
  late double value;

  Damage(this.name, this.value);
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late var pokemon;

  late List<Damage> damageFrom = [];
  late List<Damage> damageTo = [];
  late List<Damage> damageGeneral = [];

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
          var index = damageFrom.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["double_damage_from"][j]
                  ["name"]);
          if (index < 0) {
            damageFrom.add(Damage(
                responseJson["damage_relations"]["double_damage_from"][j]
                    ["name"],
                2));
          } else {
            damageFrom[index].value = damageFrom[index].value * 2;
          }

          index = damageGeneral.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["double_damage_from"][j]
                  ["name"]);
          if (index < 0) {
            damageGeneral.add(Damage(
                responseJson["damage_relations"]["double_damage_from"][j]
                    ["name"],
                2));
          } else {
            damageGeneral[index].value = damageGeneral[index].value * 2;
          }
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["double_damage_to"].length;
            j++) {
          var index = damageTo.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["double_damage_to"][j]["name"]);
          if (index < 0) {
            damageTo.add(Damage(
                responseJson["damage_relations"]["double_damage_to"][j]["name"],
                2));
          } else {
            damageTo[index].value = damageTo[index].value * 2;
          }

          index = damageGeneral.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["double_damage_to"][j]["name"]);
          if (index < 0) {
            damageGeneral.add(Damage(
                responseJson["damage_relations"]["double_damage_to"][j]["name"],
                2));
          } else {
            damageGeneral[index].value = damageGeneral[index].value * 2;
          }
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["half_damage_from"].length;
            j++) {
          var index = damageFrom.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["half_damage_from"][j]["name"]);
          if (index < 0) {
            damageFrom.add(Damage(
                responseJson["damage_relations"]["half_damage_from"][j]["name"],
                0.5));
          } else {
            damageFrom[index].value = damageFrom[index].value / 2;
          }

          index = damageGeneral.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["half_damage_from"][j]["name"]);
          if (index < 0) {
            damageGeneral.add(Damage(
                responseJson["damage_relations"]["half_damage_from"][j]["name"],
                0.5));
          } else {
            damageGeneral[index].value = damageGeneral[index].value / 2;
          }
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["half_damage_to"].length;
            j++) {
          var index = damageTo.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["half_damage_to"][j]["name"]);
          if (index < 0) {
            damageTo.add(Damage(
                responseJson["damage_relations"]["half_damage_to"][j]["name"],
                0.5));
          } else {
            damageTo[index].value = damageTo[index].value / 2;
          }

          index = damageGeneral.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["half_damage_to"][j]["name"]);
          if (index < 0) {
            damageGeneral.add(Damage(
                responseJson["damage_relations"]["half_damage_to"][j]["name"],
                0.5));
          } else {
            damageGeneral[index].value = damageGeneral[index].value / 2;
          }
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["no_damage_from"].length;
            j++) {
          var index = damageFrom.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["no_damage_from"][j]["name"]);
          if (index < 0) {
            damageFrom.add(Damage(
                responseJson["damage_relations"]["no_damage_from"][j]["name"],
                0.25));
          } else {
            damageFrom[index].value = damageFrom[index].value / 4;
          }

          index = damageGeneral.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["no_damage_from"][j]["name"]);
          if (index < 0) {
            damageGeneral.add(Damage(
                responseJson["damage_relations"]["no_damage_from"][j]["name"],
                0.25));
          } else {
            damageGeneral[index].value = damageGeneral[index].value / 4;
          }
        }
        for (int j = 0;
            j < responseJson["damage_relations"]["no_damage_to"].length;
            j++) {
          var index = damageTo.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["no_damage_to"][j]["name"]);
          if (index < 0) {
            damageTo.add(Damage(
                responseJson["damage_relations"]["no_damage_to"][j]["name"],
                0.25));
          } else {
            damageTo[index].value = damageTo[index].value / 4;
          }

          index = damageGeneral.indexWhere((element) =>
              element.name ==
              responseJson["damage_relations"]["no_damage_to"][j]["name"]);
          if (index < 0) {
            damageGeneral.add(Damage(
                responseJson["damage_relations"]["no_damage_to"][j]["name"],
                0.25));
          } else {
            damageGeneral[index].value = damageGeneral[index].value / 4;
          }
        }
      }

      damageFrom.sort((p1, p2) {
        return Comparable.compare(p2.value, p1.value);
      });
      damageTo.sort((p1, p2) {
        return Comparable.compare(p2.value, p1.value);
      });
      damageGeneral.sort((p1, p2) {
        return Comparable.compare(p2.value, p1.value);
      });
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
                          damageFrom.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height: damageFrom.length * 20,
                                        child: ListView.builder(
                                            itemCount: damageFrom.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                  child: Text(
                                                      "${damageFrom[index].value}x - ${damageFrom[index].name}"));
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
                            child: Text("General",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                          ),
                          damageGeneral.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height: damageGeneral.length * 20,
                                        child: ListView.builder(
                                            itemCount: damageGeneral.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                  child: Text(
                                                      "${damageGeneral[index].value}x - ${damageGeneral[index].name}"));
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
                          damageTo.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height: damageTo.length * 20,
                                        child: ListView.builder(
                                            itemCount: damageTo.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                  child: Text(
                                                      "${damageTo[index].value}x - ${damageTo[index].name}"));
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
