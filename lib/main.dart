import 'package:address_24/models/models.dart';
import 'package:address_24/services/people_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'screen/home_screen.dart';

void main() {
  //Wrappiamo in material app (cosi funziona tutto a livello di stile)
  //SafeArea (rispetta i limiti dello schermo per ogni telefono)
  //Il nostro Screen (rappresenta la poagina della nostra app, facciamo il return di uno scaffold (elemento che gestisce widget in una pagina))
  runApp(MaterialApp(
    home: SafeArea(child: HomeListViewScreen()),
  ));
}

class HomeListViewScreen extends StatefulWidget {
  HomeListViewScreen({super.key});

  @override
  State<HomeListViewScreen> createState() => _HomeListViewScreenState();
}

class _HomeListViewScreenState extends State<HomeListViewScreen> {
  final people = PeopleService().getPeople(results: 20).toList();

  int _currentIndex = 1;

  //underscore al nome del metodo lo rende privato
  ListTile _buildListTile(Person p) {
    return ListTile(
        //leading elemento iniziale
        leading: CircleAvatar(
          backgroundImage: NetworkImage(p.picture!.thumbnail!),
        ),
        title: Text(p.firstName!),
        subtitle: Text(p.cell!),
        //trailing elemento finale
        trailing: Icon(Icons.favorite_border),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//list view mi gestisce lo scrolling della lista
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        //dice indice selezionato della bottomNavigation bar e funziona perche e statefull e quando cambia stato si re-renderizza
        currentIndex: _currentIndex,
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          })
        },
        selectedItemColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favorite'),
          ]),
      body: _currentIndex == 0 ? ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return _buildListTile(people[index]);
        },
      ) : Center(child: Text('Hello word'),)
    );
  }
}