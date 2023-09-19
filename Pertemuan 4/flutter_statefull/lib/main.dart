import 'package:flutter/material.dart';

  const List<String> list = <String>['Kelvin', 'Reamur'];


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
      home: const MyHomePage(title: 'Konverter Suhu'),
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
  String dropdownValue = list.first;
  List<String> data = <String>["data"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Your Temperature"
              ),
              onChanged: (value) {
                print(value);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  DropdownButton<String>(
                    alignment: AlignmentDirectional.center,
                    value: dropdownValue,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Hasil",
                    style: TextStyle(
                      fontSize: 20
                    ),),
                  Text(
                    "235.6",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),),
                ],
              )
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white
                ), 
                onPressed: () {},
                child: Text(
                  'Konversi Suhu',
                  style: TextStyle(
                    fontSize: 16
                  ),  
                )),
            ),
            
            SizedBox(
              height: 20,
            ),
            Text(
              "Riwayat Konversi",
              style: TextStyle(
                fontSize: 16
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.all(8),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Text('${data[index]}'),
                );
              }, 
              separatorBuilder: (BuildContext context, index) =>
                const Divider(),
              ), 
          ],
        ),
      )
    );
  }
}
