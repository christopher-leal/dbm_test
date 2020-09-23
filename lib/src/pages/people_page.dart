import 'package:dbm_test/src/bloc/provider.dart';
import 'package:dbm_test/src/models/Person.dart';
import 'package:dbm_test/src/widgets/spinner.dart';
import 'package:flutter/material.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final peopleBloc = Provider.peopleBloc(context);
    final formsBloc = Provider.formsBloc(context);
    peopleBloc.getAllPeople(sort: formsBloc.order);
    return Scaffold(
        appBar: AppBar(
          title: Text('Personas de Ghiblin'),
        ),
        body: StreamBuilder(
          stream: peopleBloc.peopleStream,
          builder: (context, AsyncSnapshot<List<Person>> snapshot) {
            if (!snapshot.hasData) {
              return SpinnerWidget();
            }
            final people = snapshot.data;
            if (people.length != 0) {
              return ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) =>
                    _listTile(context, people[index]),
              );
              // return ListView.builder(
              //   itemCount: films.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text(films[index].title),
              //     );
              //   },
              // );
            } else {
              return Center(
                child: Text('No hay informacion'),
              );
            }
          },
        ));
  }

  Widget _listTile(BuildContext context, Person person) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        leading: Icon(
          Icons.person,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(person.name),
        subtitle: Text('Cantidad de peliculas: ${person.films.length}'),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {
          Navigator.pushNamed(context, 'person', arguments: person);
        },
      ),
    );
  }
}
