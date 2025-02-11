import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Pesquise por um produto aqui',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.image, size: 50),
                      title: Text('Produto'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text('Quantidade: '),
                              DropdownButton<int>(
                                value: 1,
                                items: List.generate(10, (index) {
                                  return DropdownMenuItem(
                                    value: index + 1,
                                    child: Text('${index + 1}'),
                                  );
                                }),
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Text(
                        'R\$ 99,99',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      )
    );
  }
}