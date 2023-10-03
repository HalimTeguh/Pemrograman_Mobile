import 'package:flutter/material.dart';
import 'package:sqlite_flutter/models/item.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key, required this.item});

  final Item item;

  @override
  State<EntryForm> createState() => _EntryFormState(this.item);
}

class _EntryFormState extends State<EntryForm> {
  late Item item;

  _EntryFormState(this.item);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(item != null){
      nameController.text = item.name;
      priceController.text = item.price.toString();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: item == null ? Text('Tambah') : Text('Ubah'),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 10,
          right: 10
        ),
        child: ListView(
          children: <Widget>[
            //nama
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20
              ),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nama Barang",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged:(value) {
                  
                },
              ),
            ),

            //harga
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20
              ),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Harga",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged:(value) {
                  
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20
              ),
              child: Row(
                children: <Widget>[
                  //tombol simpan
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                      ),
                      child: Text(
                        "Save", 
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                      onPressed: () {
                        //tambah data
                        if(item == null){
                          item = Item(nameController.text, int.parse(priceController.text));
                        }else{
                        //ubah data
                          item.name = nameController.text;
                          item.price = int.parse(priceController.text);
                        }
                        Navigator.pop(context, item);
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)
                      ),
                      child: Text(
                        "Cancel", 
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        //tambah data
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}