import 'package:all_provider/model/prod_model.dart';
import 'package:all_provider/widget/cart_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateNotifierProviderProvider = StateNotifierProvider<CartState, List<Product>>((ref) {
  return CartState();
});

class StateRivNotifier extends ConsumerWidget {
  const StateRivNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartValue = ref.watch(stateNotifierProviderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const CartDialog();
                },
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 32,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      cartValue.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      ref.read(stateNotifierProviderProvider.notifier).addProduct(product);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            cartValue
                .fold<double>(0, (previousValue, element) => previousValue + element.price)
                .toStringAsFixed(2),
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}

class CartState extends StateNotifier<List<Product>> {
  CartState() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(String id) {
    state = [
      for (final product in state)
        if (product.id != id) product
    ];
  }

  void clearCart() {
    state = [];
  }
}
