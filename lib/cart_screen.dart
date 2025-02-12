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
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: ListTile(
                      leading: Icon(Icons.image, size: 40),
                      title: Text('Produto'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              //Criar estado para este widget
                              Text('Qtd: '),
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
                        'R\$ 9,99',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                );
              },
              childCount: 5,
            ),
          ),
          // Padding(padding: EdgeInsets.fromLTRB(16, 32, 16, 0)),
            
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(child: Text('Continue Comprando')),
                Divider(height: 32, thickness: 4, color: Colors.white,),
                SizedBox(
                  height: 24
                  ),
      //           Column(
      //             children: [
      //               SizedBox(
      //                 width: double.infinity,
      //                 height: 80,
      //                 child: ListView.builder(
      //                   scrollDirection: Axis.horizontal,
      //                   itemCount: 10,
      //                   itemBuilder: (context, index) {
      //                     return Card(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       SizedBox(
      //                         height: 80,
      //                         width: 80,
      //                         child: Icon(Icons.image, size: 56, color: Colors.white),
      //                       ),
      //       const ListTile(
      //                 title: Text('Nome do Produto'),
      //                 subtitle: Text('Nome da Empresa'),
      //                 trailing: Text('\$ 9,99')       
      //       ),
            
      //     ],
      //   ),
      // );
      //                   },
      //                 ),
      //               ),
      //               ListTile(
      //                 title: Text('Nome do Produto'),
      //                 subtitle: Text('Nome da Empresa'),
      //                 trailing: Text('\$ 9,99')
      //               )
      //             ]
      //           ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}