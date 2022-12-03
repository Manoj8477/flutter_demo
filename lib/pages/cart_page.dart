import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: context.canvasColor,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //title: "Cart".text.color(context.theme.hintColor).make(),
        title: Text(
          "Cart",
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(32), child: _CartList())),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$ ${9999}",
            style: TextStyle(
                fontSize: 25, color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(
            width: 36,
          ),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  "Buy not supported yet.",
                  style: TextStyle(color: Colors.white),
                )));
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(120, 30)),
                  backgroundColor: MaterialStateProperty.all(Theme.of(context)
                      .floatingActionButtonTheme
                      .backgroundColor)),
              child: const Text("Buy", style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
            onPressed: () {}, icon: Icon(Icons.remove_circle_outline)),
        title: Text("Item1"),
      ),
    );
  }
}
