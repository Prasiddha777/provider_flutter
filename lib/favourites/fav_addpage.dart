import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/fav_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    //
    final favProvider = Provider.of<FavouriteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favourites'),
      ),
      body: ListView.builder(
          itemCount: favProvider.selectedItem.length,
          itemBuilder: (context, index) {
            return Consumer<FavouriteProvider>(
              builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    if (value.selectedItem.contains(index)) {
                      value.removeItem(index);
                    } else {
                      value.addItem(index);
                    }
                  },
                  title: Text(
                    'Item' + index.toString(),
                  ),
                  trailing: favProvider.selectedItem.contains(index)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: Colors.grey.shade500,
                        ),
                );
              },
            );
          }),
    );
  }
}
