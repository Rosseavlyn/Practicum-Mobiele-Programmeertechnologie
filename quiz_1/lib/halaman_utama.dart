import 'package:flutter/material.dart';
import 'package:quiz_1/detail_page.dart';
import 'package:quiz_1/pokemon_data.dart';

class  HalamanUtama extends StatelessWidget {
  const HalamanUtama ({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text ('Pokedex'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: listPokemon.length,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (Orientation == Orientation.portrait) ? 2 : 3),
        itemBuilder: (context, index) {
          final PokemonData pokemon = listPokemon[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                  (context) => DetailPage(pokemon: pokemon,)
                  )
                );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Image.network(pokemon.image),
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
                
              ),
            ),
          );
        },
      ),
    );
  }
}