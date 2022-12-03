import 'package:demo_project/models/catalog.dart';
import 'package:demo_project/util/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final days = 30;

  //final dummulist = List.generate(50, (index) => CatalogModel.Items[0]);
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalogue.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.Items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.Items.isNotEmpty)
                const CatalogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),

      // appBar: AppBar(
      //   title: const Center(
      //     child: Text(
      //       "Catalog App",
      //       textAlign: TextAlign.center,
      //       style: TextStyle(color: Colors.black),
      //     ),
      //   ),
      // ),
      // body: CatalogModel.Items.isNotEmpty
      //     ? GridView.builder(
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2),
      //         itemCount: CatalogModel.Items.length,
      //         itemBuilder: (context, index) {
      //           final item = CatalogModel.Items[index];
      //           return Card(
      //               clipBehavior: Clip.antiAlias,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10)),
      //               child: GridTile(
      //                 child: Image.network(item.image),
      //                 header: Container(
      //                     color: Colors.deepPurple,
      //                     padding: const EdgeInsets.all(12),
      //                     child: Text(
      //                       item.name,
      //                       style: const TextStyle(color: Colors.white),
      //                     )),
      //                 footer: Container(
      //                     color: Colors.black,
      //                     padding: const EdgeInsets.all(12),
      //                     child: Text(
      //                       "\$ ${item.price.toString()}",
      //                       style: const TextStyle(color: Colors.white),
      //                     )),
      //               ));
      //         })
      //     // ? ListView.builder(
      //     //     itemCount: CatalogModel.Items.length,
      //     //     itemBuilder: (context, index) {
      //     //       return ItemsWidget(item: CatalogModel.Items[index]);
      //     //     })
      //     : const Center(
      //         child: CircularProgressIndicator(),
      //       ),
      // drawer: const MyDrawer(),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: CatalogModel.Items.length,
      itemBuilder: ((context, index) {
        final catalog = CatalogModel.Items[index];
        return CatalogItem(catalog: catalog);
      }),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.color(MyTheme.blueishColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$ ${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.blueishColor),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .rounded
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.blueishColor).make(),
        "Trading Products".text.xl2.make(),
      ],
    );
  }
}
