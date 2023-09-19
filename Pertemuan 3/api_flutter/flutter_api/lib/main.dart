import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

final dio = Dio();

var all_data = [];

final TextEditingController nameController = TextEditingController();
final TextEditingController bankController = TextEditingController();
final TextEditingController alamatController = TextEditingController();

final TextEditingController idController_update = TextEditingController();
final TextEditingController nameController_update = TextEditingController();
final TextEditingController bankController_update = TextEditingController();
final TextEditingController alamatController_update = TextEditingController();

String url_domain = "http://192.168.77.226:8000/";
String url_all_data = url_domain = "api/all_data";
String url_create_data = url_domain = "api/create_data";
String url_show_data = url_domain = "api/show_data";
String url_update_data = url_domain = "api/update_data";
String url_delete_data = url_domain = "api/delete_data";


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
      home: data_tes(),
    );
  }
}


class data_tes extends StatefulWidget {
  const data_tes({super.key});

  @override
  State<data_tes> createState() => _data_tesState();
}

class _data_tesState extends State<data_tes> with WidgetsBindingObserver {
  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    print('MyApp state = $state');
    if(state == AppLifecycleState.inactive){
      //App transitionin to other state.
    }else if(state == AppLifecycleState.paused){
      //App is on the background
    }else if(state == AppLifecycleState.detached){
      //fluuter engine is running but detached from views
    }else if(state == AppLifecycleState.resumed){
      //App is visible and running
      runApp(MyApp());//run your app class again
    }
  }

  @override
  Widget build(BuildContext context) {
    // show_all_data();

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.red),
              alignment: Alignment.center,
              child: Text(
                "~ ~ REST API ~ ~",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.greenAccent,
                height: 30,
                minWidth: 20,
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) =>
                      _buildPopupDialog(context));
                },
                child: Text("Add Data"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                columnWidths: {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(5),
                },
                children: [
                  TableRow(
                    children: [
                      Text(
                        "Nama",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                      Text(
                        "Bank",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                      Text(
                        "Action",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                    ]
                  ),
                  for (var data in all_data)
                  TableRow(
                    children: [
                      Text(
                        data['name']!,
                        textAlign: TextAlign.center
                      ),
                      Text(
                        data['bank']!,
                        textAlign: TextAlign.center
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              width: 0,
                              color: Colors.blue,
                              style: BorderStyle.solid
                            )
                          ),
                          children: [
                            TableRow(
                              children: [
                                MaterialButton(
                                  color: Colors.blue,
                                  height: 30,
                                  minWidth: 20,
                                  onPressed: () {
                                    idController_update.text = data['id'].toString();
                                    nameController_update.text = data['name']!;
                                    bankController_update.text = data['bank']!; 
                                    alamatController_update.text = data['alamat']!;

                                    showDialog(
                                      context: context, 
                                      builder: (BuildContext context) =>
                                        _buildPopupDialog_update(context));
                                  },
                                  child: Text('Update'),
                                ),
                                MaterialButton(
                                  color: Colors.red,
                                  height: 30,
                                  minWidth: 20,
                                  onPressed: () {
                                    print("Delete");
                                    delete_data(data['id']);
                                    didChangeAppLifecycleState(AppLifecycleState.resumed);
                                  },
                                  child: Text('Delete'),
                                ),
                              ]
                            )
                          ],
                        ),
                      )
                    ] 
                  )
                ],
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.grey,
                height: 30,
                minWidth: 20,
                onPressed: () {
                  didChangeAppLifecycleState(AppLifecycleState.resumed);
                },
                child: Text("Refresh Data"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Form Data'),
    content: SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            style: TextStyle(fontSize: 12),
            controller: nameController,
            textAlign: TextAlign.left,
            decoration: const InputDecoration(
              prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 23),
              prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.email,
                color: Colors.black12
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Nama',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: bankController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 23),
              prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.money,
                color: Colors.black12
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Bank',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: alamatController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 23),
              prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.house,
                color: Colors.black12
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Alamat',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          MaterialButton(
            color: Colors.greenAccent,
            height: 30,
            minWidth: 20,
            onPressed: () {
              print("object");
              if(nameController.text == "" || bankController.text == "" || alamatController == "") {
                print("Zero");
              }else{
                create_data(nameController.text, bankController.text, alamatController.text);
                Navigator.of(context).pop();
              }
            },
            child: Text("Close"),
          )
          
        ]),
    ),
  );
}

Widget _buildPopupDialog_update(BuildContext context) {
  return new AlertDialog(
    title: Text('Update Data'),
    content: SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            enabled: false,
            style: TextStyle(fontSize: 12),
            controller: idController_update,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 23),
              prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.key,
                color: Colors.black12
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Id',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: nameController_update,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 23),
              prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.email,
                color: Colors.black12
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Nama',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: bankController_update,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 23),
              prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.money,
                color: Colors.black12
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Bank',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: alamatController_update,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 23),
              prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.house,
                color: Colors.black12
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Alamat',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          MaterialButton(
            color: Colors.greenAccent,
            height: 30,
            minWidth: 20,
            onPressed: () {
              print("object");
              if(
                nameController_update.text == "" || 
                bankController_update.text == "" || 
                alamatController_update == "") {
                print("Zero");
              }else{
                update_data(
                  idController_update.text,
                  nameController.text, 
                  bankController.text, 
                  alamatController.text
                );
                Navigator.of(context).pop();
              }
            },
            child: Text("Update"),
          )
        ]),
    ),
  );
}

void show_all_data() async {
  Response response;
  response = await dio.post(
    url_all_data,
  );
  all_data = response.data;
}

void create_data(String name, String bank, String alamat) async {
  Response response;
    response = await dio.post(
    url_create_data,
    queryParameters: {'name': name, 'bank': bank, 'alamat': alamat},
  );
  
  nameController.text = "";
  bankController.text = "";
  alamatController.text = "";
}

void delete_data(int id) async {
  Response response;
  response = await dio.post(
    url_delete_data,
  queryParameters: {'id': id},
);
}

void update_data(String id, String name, String bank, String alamat) async {
  Response response;
  response = await dio.post(
    url_update_data,
    queryParameters: {'id': id, 'name': name, 'bank': bank, 'alamat': alamat},
  );
  idController_update.text = "";
  nameController_update.text = "";
  bankController_update.text = "";
  alamatController_update.text = "";
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
