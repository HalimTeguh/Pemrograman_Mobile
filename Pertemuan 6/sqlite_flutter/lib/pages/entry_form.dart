import 'package:flutter/material.dart';
import 'package:sqlite_flutter/helpers/dbhelper.dart';
import 'package:sqlite_flutter/models/item.dart';

class EntryForm extends StatefulWidget {
  const EntryForm(this.item);

  final Item item;

  @override
  State<EntryForm> createState() => _EntryFormState(this.item);
}

class _EntryFormState extends State<EntryForm> {
  Item item;

  _EntryFormState(this.item);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController kdBarangController = TextEditingController();
  var listBarang = ["Makanan", "ATK", "Aksesoris"];

  @override
  Widget build(BuildContext context) {
    if (item != null) {
      nameController.text = item.name;
      kdBarangController.text = item.kdBarang;
      priceController.text = item.price.toString();
      stokController.text = item.stok.toString();
    } else {
      kdBarangController.text = listBarang.first;
    }
    String selected = "Makanan";

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: item.name == "" ? const Text('Tambah') : const Text('Ubah'),
          leading: const Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: ListView(
            children: <Widget>[

              //KODE BARANG
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: DropdownButtonFormField(
                    hint: Text("Kode Barang"),
                    value: selected,
                    items: listBarang.map((String kdBarang) {
                      return DropdownMenuItem(
                        value: kdBarang,
                        child: Text(kdBarang)
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selected = value!;
                      });
                    },
                  )
              ),
              
              //NAMA BARANG
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Nama Barang",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {},
                ),
              ),

              
              // Padding(
              //     padding: const EdgeInsets.only(top: 20, bottom: 20),
              //     child: DropdownButton(
              //       value: selected,
              //       items: listBarang.map((String kdBarang) {
              //         return DropdownMenuItem(
              //           value: kdBarang,
              //           child: Text(kdBarang),
              //         );
              //       }).toList(),
              //       onChanged: (String? value){
              //         setState(() {
              //           selected = value!;
              //         });
              //       })
              //   ),

              //HARGA BARANG
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Harga",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {},
                ),
              ),

              //STOK BARANG
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: stokController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Stok",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {},
                ),
              ),

              

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: <Widget>[
                    //tombol simpan
                    Expanded(
                      child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue)),
                        child: const Text(
                          "Save",
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (item == null) {
                            // tambah data
                            item = Item(
                                name: nameController.text,
                                kdBarang: kdBarangController.text,
                                price: int.parse(priceController.text),
                                stok: int.parse(stokController.text));
                          } else {
                            // ubah data
                            item.name = nameController.text;
                            item.price = int.parse(priceController.text);
                          }
                          Navigator.pop(context, item);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.red)),
                        child: const Text(
                          "Cancel",
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
