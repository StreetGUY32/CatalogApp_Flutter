import 'dart:convert';
import 'dart:ui';
import 'package:first_app/models/catalog.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/item_Widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));

    final catalogjson =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedJson = jsonDecode(catalogjson);
    // print(decodedJson);
    var productData = decodedJson['products'];
    // print(productData);
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(4, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 18,
                ),
                itemBuilder: ((context, index) {
                  final item = CatalogModel.items[index];
                  final price = item.price.toString();
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GridTile(
                        child: Image.network(
                          item.image,
                        ),
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                          padding: EdgeInsets.all(5.0),
                        ),
                        footer: Container(
                          child: Text('\$$price',
                              style: TextStyle(color: Colors.white)),
                          color: Colors.black,
                          padding: EdgeInsets.all(5.0),
                        ),
                      ));
                }),
                itemCount: CatalogModel.items.length,
              )
            // ? ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: ((context, index) => ItemWidget(
            //           item: CatalogModel.items[index],
            //         )),
            //   )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.blue,
                      size: 60,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Loading. Please wait...',
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  )
                ],
              ),
      ),
      backgroundColor: Colors.white,
      drawer: Mydrawer(),
    );
  }
}
