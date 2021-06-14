import 'package:flutter/material.dart';
import 'package:great_places/controller/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatefulWidget {
  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (context, greatPlaces, _) => greatPlaces.itemsCount == 0
            ? Center(
                child: Text('Nenhum local cadastrado!'),
              )
            : ListView.builder(
                itemCount: greatPlaces.itemsCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        FileImage(greatPlaces.itemByIndex(i).image),
                  ),
                  title: Text(greatPlaces.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
