import 'package:dbm_test/src/models/Film.dart';
import 'package:flutter/material.dart';

class FilmPage extends StatelessWidget {
  FilmPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Film film = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _createSliverAppBar(context, film),
          SliverList(
              delegate: SliverChildListDelegate([
            _createPoster(context, film),
            _createDescription(context, film),
          ]))
        ],
      ),
    );
  }

  Widget _createSliverAppBar(BuildContext context, Film film) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          film.title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              shadows: [BoxShadow(blurRadius: 10, offset: Offset(0.0, 1.0))]),
        ),
        background: FadeInImage(
          image: AssetImage('assets/images/${film.getBanner()}'),
          placeholder: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
          // fadeInDuration: Duration(milliseconds: 150),
        ),
      ),
    );
  }

  Widget _createPoster(BuildContext context, Film film) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: film.uid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                height: 200.0,
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage('assets/images/${film.getPoster()}'),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  film.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.0,
                  ),
                  // overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      'Calificación: ${film.rtScore}% ',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    )
                  ],
                ),
                Text('Año de publicacion: ${film.releaseDate}',
                    style: TextStyle(color: Colors.black, fontSize: 15.0))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createDescription(BuildContext context, Film film) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        film.description,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
