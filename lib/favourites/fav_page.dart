import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/favourites/fav_addpage.dart';
import 'package:provider_app/provider/fav_provider.dart';

class FavoriteScreens extends StatefulWidget {
  const FavoriteScreens({super.key});

  @override
  State<FavoriteScreens> createState() => _FavoriteScreensState();
}

class _FavoriteScreensState extends State<FavoriteScreens> {
  //
  // List<int> favList = [];
  //
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteProvider>(context, listen: false);
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFavouriteScreen()));
            },
            child: Container(
              width: 50,
              height: 25,
              child: Icon(Icons.favorite),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Card(
              child: Consumer<FavouriteProvider>(
                builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (favProvider.selectedItem.contains(index)) {
                        favProvider.removeItem(index);
                      } else {
                        favProvider.addItem(index);
                      }
                    },
                    title: Text('Item ' + index.toString()),
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
              ),
            );
          }),
    );
  }
}
