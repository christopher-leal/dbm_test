import 'package:dbm_test/src/bloc/provider.dart';
import 'package:dbm_test/src/models/Film.dart';
import 'package:dbm_test/src/widgets/spinner.dart';
import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filmsBloc = Provider.filmsBloc(context);
    filmsBloc.getAllFilms();
    return Scaffold(
        appBar: AppBar(
          title: Text('Ghiblins films'),
        ),
        body: StreamBuilder(
          stream: filmsBloc.filmsStream,
          builder: (context, AsyncSnapshot<List<Film>> snapshot) {
            if (!snapshot.hasData) {
              return SpinnerWidget();
            }
            final films = snapshot.data;
            if (films.length != 0) {
              return PageView.builder(
                pageSnapping: false,
                scrollDirection: Axis.vertical,
                itemCount: films.length,
                itemBuilder: (context, index) => _card(context, films[index]),
                controller: PageController(viewportFraction: 1, initialPage: 0),
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

  Widget _card(BuildContext context, Film film) {
    film.uid = '${film.id}-films';
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'film', arguments: film);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        // height: 400.0,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            Hero(
              tag: film.uid,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  height: 550.0,
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
                  color: Theme.of(context).primaryColor, fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
