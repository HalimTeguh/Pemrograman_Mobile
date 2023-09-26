import 'package:flutter/material.dart';
import 'package:navirute_flutter/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: "Sugar",
        price: 5000,
        image: "lib/assets/gula.jpg",
        desc:
            "Diproduksi dari tetes tebu alami dengan kandungan kadar molasses yang lebih tinggi guna menghasilkan aroma caramel alami. Warna kuning ke-emasan dan Butiran gula yang seragam memberikan tekstur dan konsistensi untuk campuran minuman, taburan roti dan kue, atau membuat kue tradisional."),
    Item(
        name: "Garam Kapal 500gr",
        price: 2000,
        image: "lib/assets/garam.jpg",
        desc:
            "Garam CAP KAPAL 500gr merupakan garam beryodium persembahan Cap Kapal yang diproduksi secara higienis dan aman untuk dikonsumsi. Garam ini memiliki kemasan yang praktis dan mudah untuk digunakan untuk melengkapi bahan dapur Anda.")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Shopping List"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/item', arguments: item);
                },
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.only(top: 8, bottom: 8, right: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(0),
                            ),
                            child: Image(
                              width: 80,
                              image: AssetImage(item.image),
                              fit: BoxFit.cover,
                            )
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        Expanded(
                          child: Text(
                            "Rp${item.price},-",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
