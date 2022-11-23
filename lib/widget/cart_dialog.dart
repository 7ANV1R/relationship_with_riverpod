import 'package:all_provider/screens/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartDialog extends StatelessWidget {
  const CartDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final cartValue = ref.watch(stateNotifierProviderProvider);
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: const Text('Cart'),
          content: Builder(builder: (context) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...cartValue.map(
                    (e) => ListTile(
                      title: Text(e.title),
                      trailing: IconButton(
                        onPressed: () {
                          ref.read(stateNotifierProviderProvider.notifier).removeProduct(e.id);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          actions: [
            Column(
              children: [
                Text(
                  'Total: \$${cartValue.fold<double>(0, (sum, item) => sum + item.price).toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(stateNotifierProviderProvider.notifier).clearCart();
                  },
                  child: const Text('Clear'),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
