import 'package:flutter/material.dart';

void main() {
  runApp(const ExploreMundoApp());
}

class Place {
  final String imageAsset;
  final String title;
  final String description;
  final String detailedDescription;
  final List<IconData> icons;

  Place({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.detailedDescription,
    required this.icons,
  });
}

class ExploreMundoApp extends StatelessWidget {
  const ExploreMundoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore o Mundo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExploreMundoHome(),
    );
  }
}

class ExploreMundoHome extends StatelessWidget {
  ExploreMundoHome({super.key});

  final List<Place> places = [
    Place(
      imageAsset: 'imagens/cristo.jpeg',
      title: 'Cristo Redentor',
      description: 'Rio de Janeiro, Brasil',
      detailedDescription: 'A imagem de Jesus Cristo de braços abertos no Rio de Janeiro'
                           ' faz jus ao título de uma das 7 Maravilhas do Mundo Moderno.'
                           ' Inaugurado em 1931, levou 5 anos para ser construído, e hoje é um dos cartões'
                           ' postais mais conhecidos do Brasil. Localizada a 709 metros'
                           ' acima do nível do mar, a construção tem 38 metros de comprimento,'
                           ' sendo que 8 metros compõem apenas o pedestal. É a obra mais jovem entre'
                           ' as demais maravilhas do mundo moderno.',
      icons: [Icons.near_me, Icons.share],
    ),
    Place(
      imageAsset: 'imagens/machu.jpeg',
      title: 'Machu Picchu',
      description: 'Cusco, Peru',
      detailedDescription: 'Machu Picchu é uma das mais prestigiadas heranças do povo Inca,'
                           ' um dos mais intrigantes da história. Descoberta em 1911,'
                           ' a Cidade Perdida dos Incas fica no topo de uma montanha'
                           ' com 2400 metros de altitude, no vale do rio Urubamba.'
                           ' Construída no século 15, conta hoje com apenas 30% de'
                           ' sua construção original. O restante foi todo reconstruído,'
                           ' permitindo uma pequena ideia do que seria toda a sua grandiosidade,'
                           ' caso a obra permanecesse intacta até hoje.',
      icons: [Icons.near_me, Icons.share],
    ),
    Place(
      imageAsset: 'imagens/coliseu.jpeg',
      title: 'Coliseu de Roma',
      description: 'Roma, Italia',
      detailedDescription: 'Símbolo do Império Romano, o Coliseu é o mais famoso'
                           ' anfiteatro do mundo e uma das obras arquitetônicas mais'
                           ' importantes da história da humanidade. Com cerca de 2 mil'
                           ' anos de história, foi palco de lutas de gladiadores a obras'
                           ' teatrais. Atualmente, é uma das 7 Maravilhas do Mundo Moderno'
                           ' mais disputadas entre os visitantes, e provavelmente um dos'
                           ' atrativos responsáveis por manter a Itália entre os países'
                           ' mais visitados do mundo.',
      icons: [Icons.near_me, Icons.share],
    ),
    Place(
      imageAsset: 'imagens/chichen.jpeg',
      title: 'Chichen Itza',
      description: 'Yucatan, Mexico',
      detailedDescription: 'A civilização maia nos presenteou com legados arquitetônicos,'
                           ' artísticos, matemáticos, astronômicos e sociais. Chichén'
                           ' Itzá, escolhida como uma das Maravilhas do Mundo Moderno,'
                           ' era o centro político e econômico desse povo. A pirâmide'
                           ' de Kukulkan (provavelmente o ícone mais importante'
                           ' e popular de todos os templos Maias), a Praça das Mil'
                           ' Colunas, o Campo de Jogos dos Prisioneiros e o Templo de'
                           ' Chac Mool também são exemplos da grandiosidade e dedicação deste povo'
                           ' e são atrações que podem ser visitadas dentro desse mesmo sítio arqueológico.',
      icons: [Icons.near_me, Icons.share],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Mundo'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return ExpandablePlaceCard(place: places[index]);
        },
      ),
    );
  }
}

class ExpandablePlaceCard extends StatefulWidget {
  final Place place;

  const ExpandablePlaceCard({super.key, required this.place});

  @override
  _ExpandablePlaceCardState createState() => _ExpandablePlaceCardState();
}

class _ExpandablePlaceCardState extends State<ExpandablePlaceCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Image.asset(widget.place.imageAsset, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.place.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(widget.place.description),
                if (_isExpanded)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.place.detailedDescription,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.place.icons.map((icon) {
                    return IconButton(
                      icon: Icon(icon),
                      onPressed: () {
                        // Implement the action for each icon
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
