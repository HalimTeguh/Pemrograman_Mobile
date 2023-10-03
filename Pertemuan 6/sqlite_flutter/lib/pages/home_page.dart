import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter/helpers/dbhelper.dart';
import 'package:sqlite_flutter/models/item.dart';
import 'package:sqlite_flutter/pages/entry_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DbHelper dbHelper = DbHelper();
  int count = 0;
  late List<Item> itemList;

  @override
  void initState(){
    super.initState();
    itemList = [];
    updateListView();
  }
  
  @override
  Widget build(BuildContext context) {
    // itemList ??= List<Item>();
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Daftar Item"),
        ),
        body: Column(
          children: [
            Expanded(
              child: createListView(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: TextButton(
                  child: Text(
                    "Tambah Item",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  onPressed: () async {
                    var item = await navigateToEntryForm(
                      context, Item(name: "", price: 0));

                    if (item != null) {
                      int result = await dbHelper.insert(item);
                      if (result > 0) {
                        updateListView();
                      }
                    }
                  },
                ),
              ),
            )
          ],
        ));
  }

  Future<Item?> navigateToEntryForm(BuildContext context, Item item) async {
    DbHelper dbHelper = DbHelper();

    var result = await Navigator.push(context, 
      MaterialPageRoute(builder: (BuildContext context){
        return EntryForm(item);
      }));
    return result;
  }

  ListView createListView(){
    TextStyle textStyle = TextStyle(color: Colors.white);
    
    var length = itemList.length~/2;

    if(itemList.isEmpty){
      return ListView();
    }

    return ListView.builder(
      itemCount: length,
      itemBuilder: (BuildContext context, index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text(this.itemList[index].name),
            subtitle: Text(this.itemList[index].price.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3: Panggil Fungsio untuk delete dari DB berdasarkan Item
                print("deleting ${itemList[index].id}");
                var delete = dbHelper.delete(itemList[index].id);
                updateListView();
              },
            ),
            onTap: () async {
              print(this.itemList[index].id);
              print("Banyak Item: ${length}");

              var updatedItem = await navigateToEntryForm(context, this.itemList[index]);
              if (updatedItem != null){
                UpdatedItem(updatedItem);
              }
            },
          ),
        );
      });
  }

  void updateListView(){
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Item>> itemListFuture = dbHelper.getItemList();

      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }

  Future<void> UpdatedItem(Item item) async {
    var result = await dbHelper.update(item);
    if(result > 0){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil Memperbarui")));
      updateListView();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Gagal Memperbarui")));
    }
  }

}