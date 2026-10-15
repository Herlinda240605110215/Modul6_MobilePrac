import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game List',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const GamePage(),
    );
  }
}

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  final List<Map<String, String>> dataGame = const [
    {
      'judul': 'Albion Online',
      'genre': 'MMORPG',
      'rilis': '2017',
      'gambar': 'https://picsum.photos/100/100?1',
    },
    {
      'judul': 'Warframe',
      'genre': 'Shooter',
      'rilis': '2013',
      'gambar': 'https://picsum.photos/100/100?2',
    },
    {
      'judul': 'Rocket League',
      'genre': 'Sports',
      'rilis': '2015',
      'gambar': 'https://picsum.photos/100/100?3',
    },
    {
      'judul': 'Fortnite',
      'genre': 'Battle Royale',
      'rilis': '2017',
      'gambar': 'https://picsum.photos/100/100?4',
    },
    {
      'judul': 'Dota 2',
      'genre': 'MOBA',
      'rilis': '2013',
      'gambar': 'https://picsum.photos/100/100?5',
    },
    {
      'judul': 'World of Tanks',
      'genre': 'Action',
      'rilis': '2010',
      'gambar': 'https://picsum.photos/100/100?6',
    },
    {
      'judul': 'League of Legends',
      'genre': 'MOBA',
      'rilis': '2009',
      'gambar': 'https://picsum.photos/100/100?7',
    },
    {
      'judul': 'Paladins',
      'genre': 'Shooter',
      'rilis': '2018',
      'gambar': 'https://picsum.photos/100/100?8',
    },
  ];

  Widget tombolBaca() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Text(
        'Baca Info',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget listItem(
      String gambar,
      String judul,
      String genre,
      String rilis,
      ) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 2),
            color: Colors.black12,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              gambar,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 70,
                  height: 70,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image),
                );
              },
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  genre,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),

                Text(
                  'Rilis: $rilis',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          tombolBaca(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Daftar Game'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: dataGame.length,
        itemBuilder: (context, index) {
          return listItem(
            dataGame[index]['gambar']!,
            dataGame[index]['judul']!,
            dataGame[index]['genre']!,
            dataGame[index]['rilis']!,
          );
        },
      ),
    );
  }
}
