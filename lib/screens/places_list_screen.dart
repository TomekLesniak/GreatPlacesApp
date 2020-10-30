import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('No places yet, start adding some!'),
        ),
        builder: (ctx, greatPlacesData, ch) => greatPlacesData.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: greatPlacesData.items.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        FileImage(greatPlacesData.items[index].image),
                  ),
                  title: Text(greatPlacesData.items[index].title),
                  onTap: () {
                    //detail page
                  },
                ),
              ),
      ),
    );
  }
}
