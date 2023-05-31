import 'package:flutter/material.dart';
import 'package:quiz_1/pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {

  final PokemonData pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          automaticallyImplyLeading: true,
          title: Text("Detail Pokemon"),
          centerTitle: true,
           actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
              ),
              tooltip: 'Add to favorite',
              onPressed: () {
                if (pokemon.isFavorite == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Successfuly adding to favourites'),
                      backgroundColor: Colors.black,
                    ),
                  );
                  pokemon.isFavorite = true;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Successfuly removing from favourites'),
                      backgroundColor: Colors.black,
                    ),
                  );
                  pokemon.isFavorite = false;
                }
              },
            ),
          ],
        ),

        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pokemon.image.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        pokemon.image,
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Text(
                pokemon.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                'Type : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
             Expanded(
              child: ListView.builder(
                itemCount: pokemon.type.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(pokemon.type[index]),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                'Weakness : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokemon.weakness.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(pokemon.weakness[index]),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                'Previous Evolution : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokemon.prevEvolution.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(pokemon.prevEvolution[index]),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                'Next Evolution : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokemon.nextEvolution.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(pokemon.nextEvolution[index]),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
              child: ElevatedButton(
                onPressed: (){
                  _launchInBrowser(
                    pokemon.wikiUrl,
              );
            },
            child: Text('Browse'),
            
            ),
            )
            
          ],
        )
        );
  }


    Future<void> _launchInBrowser(String url) async {
      final Uri _url = Uri.parse(url);
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
