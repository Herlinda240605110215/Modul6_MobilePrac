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
      title: 'Demo GridView Builder',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final List<Map<String, String>> dataBerita = const [
    {
      'title': 'Teknologi Terbaru',
      'image': 'https://picsum.photos/400/300?1',
    },
    {
      'title': 'Perkembangan Teknologi',
      'image': 'https://picsum.photos/400/300?2',
    },
    {
      'title': 'Inovasi Digital',
      'image': 'https://picsum.photos/400/300?3',
    },
    {
      'title': 'Teknologi Masa Depan',
      'image': 'https://picsum.photos/400/300?4',
    },
    {
      'title': 'Internet dan Teknologi',
      'image': 'https://picsum.photos/400/300?5',
    },
    {
      'title': 'Dunia Digital',
      'image': 'https://picsum.photos/400/300?6',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo GridView Builder'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.25,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: dataBerita.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(
                    dataBerita[index]['title']!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                child: Image.network(
                  dataBerita[index]['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
