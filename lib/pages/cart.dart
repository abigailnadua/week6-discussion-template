import 'package:flutter/material.dart';
import '../models/item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getItems(context),
          computeCost(),
          const Divider(height: 4, color: Colors.black),
          Flexible(
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                ElevatedButton(
                    onPressed: () {
                      // TODO: remove all items in the cart when this button is pressed
                    },
                    child: const Text("Reset")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/checkout");
                    },
                    child: const Text("Checkout"))
              ]))),
          TextButton(
            child: const Text("Go back to Product Catalog"),
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    // TODO: get the items from the cart
    List<Item> products = [];
    Item? product;
    return products.isEmpty
        ? const Text('No Items yet!')
        : Expanded(
            child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.food_bank),
                    title: Text(products[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        product = products[index];
                        // TODO: remove the item from cart when this icon is clicked

                        if (products.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("${product!.name} removed!"),
                            duration:
                                const Duration(seconds: 1, milliseconds: 100),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Cart Empty!"),
                            duration: Duration(seconds: 1, milliseconds: 100),
                          ));
                        }
                      },
                    ),
                  );
                },
              )),
            ],
          ));
  }

  Widget computeCost() {
    // TODO: dynamically compute cost
    return Container();
  }
}
