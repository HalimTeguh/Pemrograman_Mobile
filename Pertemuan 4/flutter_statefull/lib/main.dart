
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
  List<String> listItem = <String>["Kelvin", "Reamur"];
  List<String> listViewItem = [];

  double? _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;


  void dropdownOnChanged (String changeValue){
    setState(() {
      _newValue = changeValue;
    });
  }

  void perhitunganSuhu(){
    setState(() {
      if(inputController.text == ""){
        inputController.text = "0";
      }
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin"){
        _result = _inputUser! + 273;
        listViewItem.add('Kelvin : $_result');
        print(_result);
      }else{
        _result = (4/5) * _inputUser!;
        listViewItem.add('Reamur : $_result');
        print(_result);
      }
    });
  }

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
                inputController.text = value;
                print(inputController);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  DropdownButton<String>(
                    alignment: AlignmentDirectional.center,
                    items: listItem.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value));
                    }).toList(),
                    value: _newValue,
                    onChanged: (String? value) {
                      setState(() {
                        _newValue = value!;
                      });
                    },
                  ),
                  SizedBox(height: 20,),

                  Result(result: _result),
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
                onPressed: () {
                  perhitunganSuhu();
                },
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
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: listViewItem.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        listViewItem[index]
                      ),
                    ),
                  );
                }, 
                separatorBuilder: (BuildContext context, int index) => const Divider(), 
              ),
            )
          ],
        ),
      )
    );
  }
  
}



class Result extends StatelessWidget {
  const Result({super.key, required this.result});

  final double result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(children: [
        Text(
          "Hasil",
          style: TextStyle(
            fontSize: 20
          ),
        ),
        Text(
          result.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
      ]),
    );
  }
}