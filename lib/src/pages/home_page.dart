import 'package:dbm_test/src/bloc/forms_bloc.dart';
import 'package:dbm_test/src/bloc/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sort = 0;
  @override
  Widget build(BuildContext context) {
    // final data = filmBloc.getData('people', People);
    return Scaffold(
      body: Stack(
        children: [_createBackground(context), _createForm(context)],
      ),
    );
  }

  Widget _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageBackground = Container(
      height: size.height * .4,
      width: double.infinity,
      child: FadeInImage(
          fit: BoxFit.fill,
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/images/icon_image.png')),
    );

    return Stack(children: [
      imageBackground,
      SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Icon(
                Icons.local_movies,
                color: Colors.white,
                size: 80.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Studio Ghibli ',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )
            ],
          ),
        ),
      )
    ]);
  }

  Widget _createForm(BuildContext context) {
    final formsBloc = Provider.formsBloc(context);

    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 180.0,
          )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            width: size.width * .85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: [
                Text(
                  'Busqueda',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 50.0,
                ),
                _createDropDown(formsBloc),
                SizedBox(
                  height: 20.0,
                ),
                _createRadioOrder(formsBloc),
                SizedBox(
                  height: 20.0,
                ),
                _createButton(formsBloc),
              ],
            ),
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _createDropDown(FormsBloc formsBloc) {
    print(formsBloc.searchType);
    return StreamBuilder(
      stream: formsBloc.dropdownStream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text('Tipo de pelicula', style: TextStyle(fontSize: 18.0)),
              DropdownButton(
                value: formsBloc.searchType,
                icon: Icon(
                  Icons.movie,
                  color: Theme.of(context).primaryColor,
                ),
                hint: Text('Tipo de pelicula'),
                items: formsBloc.searchTypes.map((type) {
                  return DropdownMenuItem(
                    child: Text(type.title),
                    value: type.value,
                  );
                }).toList(),
                onChanged: (value) => formsBloc.changeSearchType(value),
              ),
            ],
          ),
        );
      },
    );
    // child: TextField(
    //   keyboardType: TextInputType.emailAddress,
    //   decoration: InputDecoration(
    //       icon: Icon(
    //         Icons.alternate_email,
    //         color: Colors.deepPurple,
    //       ),
    //       hintText: 'Ingresa tu correo',
    //       hintStyle: TextStyle(color: Theme.of(context).primaryColor),
    //       labelText: 'Email',
    //       errorText: snapshot.hasError ? snapshot.error : null,
    //       counterText:
    //           snapshot.hasData ? '${snapshot.data?.length}' : '0'),
    //   onChanged: (value) => bloc.changeEmail(value),
  }

  Widget _createRadioOrder(FormsBloc formsBloc) {
    return StreamBuilder(
      stream: formsBloc.orderStream,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text('Orden de la busqueda', style: TextStyle(fontSize: 18.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: true,
                    groupValue: formsBloc.order,
                    onChanged: (value) => _changeOrder(formsBloc, value),
                  ),
                  Text(
                    'Ascendente',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Radio(
                    value: false,
                    groupValue: formsBloc.order,
                    onChanged: (value) => _changeOrder(formsBloc, value),
                  ),
                  Text(
                    'Descendente',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _changeOrder(FormsBloc formsBloc, value) {
    formsBloc.changeOrder(value);
  }

  Widget _createButton(FormsBloc formsBloc) {
    return RaisedButton(
      elevation: 0.0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        child: Text('Buscar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: () => _search(context, formsBloc),
    );
  }

  _search(
    BuildContext context,
    FormsBloc formsBloc,
  ) {
    switch (formsBloc.searchType) {
      case 'films':
        Navigator.pushNamed(context, 'films');

        break;
      case 'people':
        Navigator.pushNamed(context, 'people');

        break;
      default:
    }
  }

  // List<DropdownMenuItem<String>> _createDropDownItem(List<Item> searchTypes) {
  //   print(searchTypes);
  //   return searchTypes.map((type) {
  //     print(type.value);
  //     return DropdownMenuItem(
  //       child: Text(type.title),
  //       value: type.value,
  //     );
  //   }).toList();
  // }
}
