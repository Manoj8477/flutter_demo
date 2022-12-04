import 'package:demo_project/models/cart.dart';
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
  _CartTotal({Key? key}) : super(key: key);
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$ ${_cart.totalPrice}",
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
                  "Buy not supported yet",
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
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? const Center(
            child: Text("Nothing to show"),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove_circle_outline)),
              title: Text(_cart.items[index].name),
            ),
          );
  }
}
