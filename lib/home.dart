import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pokeflutter/pokemon_detail.dart';

import 'loading_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Pokemon {
  late String id;
  late String name;
}

class _HomePageState extends State<HomePage> {
  late List pokemons = [];
  late List filteredPokemons = [];
  bool initialized = false;

  loadPokedex() async {
    try {
      var response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=1010&offset=0'),
      );

      var responseJson = jsonDecode(response.body);
      List pokemonsList = responseJson["results"];
      pokemons.clear();
      for (int i = 0; i < pokemonsList.length; i++) {
        Pokemon pokemon = Pokemon();
        pokemon.id = (i + 1).toString();
        pokemon.name = pokemonsList[i]['name'];
        pokemons.add(pokemon);
      }
      if (!initialized) {
        filteredPokemons = pokemons;
        initialized = true;
      }
      return responseJson;
    } catch (e) {
      print(e);
    }
  }

  List filter(text) {
    if (text != "") {
      return pokemons.where((o) => o.name.toString().contains(text)).toList();
    }

    return pokemons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(110, 119, 117, 117),
        appBar: AppBar(
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
          future: loadPokedex(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: LoadingIcon(
                loadingFormat: LoadingFormat.Pokeball,
                size: 100.0,
                speed: 4.0,
              ));
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pesquisar',
                    ),
                    onChanged: (String text) {
                      setState(() {
                        filteredPokemons = filter(text);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: filteredPokemons.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => PokemonDetailPage(
                                  id: filteredPokemons[index].id)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 2),
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${filteredPokemons[index].id}.png',
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (BuildContext context,
                                        Object exception,
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
                                      "[#${filteredPokemons[index].id}] ${filteredPokemons[index].name}")
                                ]),
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
