import 'package:dbm_test/src/bloc/provider.dart';
import 'package:dbm_test/src/models/Film.dart';
import 'package:dbm_test/src/models/Person.dart';
import 'package:dbm_test/src/widgets/spinner.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget {
  PersonPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Person person = ModalRoute.of(context).settings.arguments;
    final filmsBloc = Provider.filmsBloc(context);
    final filmsIds = person.getFilmsIds();
    filmsBloc.getFilmByIds(filmsIds);
    return Scaffold(
      appBar: AppBar(
        title: Text('Personas de Ghiblin'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.0,
            ),
            Text(
              '${person.name}',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  'Genero: ${person.getGender}',
                  style: TextStyle(fontSize: 17.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Edad: ${person.age}',
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
            SizedBox(
              height: 100.0,
            ),
            Column(
              children: [
                Text(
                  'Peliculas',
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                  // height: 300.0,
                  child: SizedBox(
                    height: 300.0,
                    child: StreamBuilder(
                      stream: filmsBloc.filmsStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return SpinnerWidget();
                        }
                        final films = snapshot.data;
                        if (films.length != 0) {
                          return PageView.builder(
                            pageSnapping: false,
                            itemCount: films.length,
                            itemBuilder: (context, index) =>
                                _card(context, films[index]),
                            controller: PageController(
                                viewportFraction: .5, initialPage: 0),
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
                    ),
                  ),
                  //     child: PageView.builder(

                  //   itemBuilder: (context, index) {
                  //     return Text('$index');
                  //     // _createCard(context, filmsBloc, person.getFilmsIds());
                  //   },
                  //   itemCount: person.getFilmsIds().length,
                  // )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _card(BuildContext context, Film film) {
    film.uid = '${film.id}-person';
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'film', arguments: film);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Hero(
              tag: film.uid,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  width: double.infinity,
                  placeholder: AssetImage('assets/loading.gif'),
                  image: AssetImage('assets/images/${film.getPoster()}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              film.title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
