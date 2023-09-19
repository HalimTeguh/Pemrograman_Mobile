import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MyApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        color: const Color.fromARGB(100, 179, 229, 255),
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
               decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23)
               ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: const TextHeader(
                        title: 'Berita Terbaru', 
                        size: 20,
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: const TextHeader(
                        title: 'Inovasi Teknologi',
                        size: 20,),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Image.asset('assets/images/Hero.jpeg')
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const TextHeader(
                          size: 20,
                          align: TextAlign.center,
                          title: 'Telkom Data Ekosistem Gelar NeutraDC Summit 2023, Bahas Proteksi Data', 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const TextHeader(
                          align: TextAlign.justify,
                          size: 14,
                          title: 'PT Telkom Indonesia (Persero) Tbk menggelar diskusi panel berskala internasional "NeutraDC Summit 2023" melalui anak usahanya yang bergerak di bisnis data center.', 
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const PostContent(
              title: "Akun Youtube DPR Diretas, BSSN Kasih Tips Ampuhnya",
              image: "assets/images/content4.jpeg",
              date: "Malang, 11 September 2023",
            ),
            const PostContent(
              title: "Akun Youtube DPR Diretas, BSSN Kasih Tips Ampuhnya",
              image: "assets/images/content3.jpeg",
              date: "Malang, 10 September 2023",
            ),
            const PostContent(
              title: "Akun Youtube DPR Diretas, BSSN Kasih Tips Ampuhnya",
              image: "assets/images/content2.jpeg",
              date: "Malang, 07 September 2023",
            ),
            const PostContent(
              title: "Sony Gelar Playstation Publisher Sale di Steam dan Epic Games",
              image: "assets/images/content1.jpeg",
              date: "Malang, 10 Juni 2023",
            ),
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PostContent extends StatelessWidget {
  const PostContent({
    super.key, required this.title, required this.image, required this.date,
  });
  final String title;
  final String image;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10, bottom: 10),
                width: 150,
                decoration: const BoxDecoration(),
                child: Image.asset(
                  image, 
                  fit: BoxFit.cover,),
              ),
              Expanded(
                child: TextHeader(
                  title: title, 
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            child: TextHeader(
              title: date, 
              size: 16,
              align: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({
    super.key, required this.title, this.color, this.fontWeight, this.align, required this.size,
  });
  final String title;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: size, 
        fontWeight: fontWeight,
        color: color),
    );
  }
}


