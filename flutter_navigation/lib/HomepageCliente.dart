import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/AgendarTransporte.dart';
import 'package:flutter_navigation/AlterarContaCliente.dart';
import 'package:flutter_navigation/ListarPedidosCliente.dart';
import 'package:flutter_navigation/teste.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Dados.dart';
import 'Suporte.dart';
import 'Login.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class Home extends StatefulWidget{
  @override
  HomepageCliente createState() => HomepageCliente();
}

class HomepageCliente extends State<Home> {

  int _selectedIndex = 0;
  String locationL = "Insira Localização para Levantamento ou Localize a sua Posição";
  String locationE = "Insira Localização para Entrega";
  String googleApikey = "AIzaSyBPCxZHYUS5qWy7J40Tu1wfMvzbv9F_Re4";
  var latL;
  var lonL;
  var latE;
  var lonE;

  @override
  initState() {

    //try {
      if (Dados().fazerLocalizacao == true &&
          !["", null, false, 0].contains(Dados().itemALocalizar)) {
        var value = Dados().itemALocalizar;

        // specified current users location
        CameraPosition cameraPosition = new CameraPosition(
          target: LatLng(value.latitude, value.longitude),
          zoom: 10,
        );

        final GoogleMapController controller =  _controller.future as GoogleMapController;
        controller.animateCamera(
            CameraUpdate.newCameraPosition(cameraPosition));

        setState(() {});

        print("TESTE DETALHES");
        Dados().fazerLocalizacao = false;
        Dados().itemALocalizar = "";
      }
  //  }catch(E){}
  }

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });

    if(index==1){

      //////////////////
      getUserCurrentLocation().then((value) async {

        latL = value.latitude;
        lonL = value.longitude;

        GeoCode geoCode = GeoCode();

        try {

          var coordinates2 = await geoCode.reverseGeocoding(latitude: latL, longitude: lonL);

          print('TESTE !!!!1$coordinates2');

          Coordinates coordinates = await geoCode.forwardGeocoding(
              address: "532 S Olive St, Los Angeles, CA 90013");

        //  Future<Address> reverseGeocoding({double latitude, double longitude})

          print("Latitude: ${coordinates.latitude}");
          print("Longitude: ${coordinates.longitude}");
        } catch (e) {
          print(e);
        }
      //  final coordinates =
      //  new Coordinates(value.position.latitude, value.position.longitude);
      //  var addresses = await Geocoder.google(kGoogleApiKey)
    //        .findAddressesFromCoordinates(coordinates);

      //  print("Address: ${addresses.first.featureName}");

        print("TESTE $latL <> $lonL");

        ///////////////

        Dados().utilizadorAtivo.atualizarLocalizacao(value.latitude, value.longitude);
        // marker added for current users location
        _markers.add(
            Marker(
              markerId: MarkerId("1"),
              position: LatLng(value.latitude, value.longitude),
              infoWindow: InfoWindow(
                title: 'Localização Atual',
              ),
            )
        );

        // specified current users location
        CameraPosition cameraPosition = new CameraPosition(
          target: LatLng(value.latitude, value.longitude),
          zoom: 10,
        );

        final GoogleMapController controller = await _controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

        setState(() {
        });
      });

    }

    if(index == 2){
      if(!["", null, false, 0].contains(locationL) &&
          !["", null, false, 0].contains(locationE)){
    showAlertDialog(context, locationL, locationE,
    latL, lonL, 0.0, 0.0);
    }else{
        showAlertDialogLocalizacoes(context);
      }
    }

  }

  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(39.5572, -7.8537),
    zoom: 5,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[

  ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Images/playstore.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('Menu - Bem-vindo !'),
            ),
            ListTile(
              title: const Text('Solicitar Transporte'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              title: const Text('Agendar Transporte'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgendarTransporte()),
                );
              },
            ),
            ListTile(
              title: const Text('Listagem de Transportes'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListarPedidosCliente()),
                );
              },
            ),
            ListTile(
              title: const Text('Suporte'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Suporte()),
                );
              },
            ),
            ListTile(
              title: const Text('Definições de Conta'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>AlterarContaCliente()),
                );
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Dados().utilizadorAtivo = null;
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_location_outlined),
            label: 'Localizar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Solicitar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      appBar: AppBar(
        title: Text('Uber de Mercadorias'),
        actions: [
          Image(image: AssetImage('Images/playstore.png'))
        ],
      ),



      body: Stack(
        children: [

          // on below line creating google maps
          GoogleMap(
            // on below line setting camera position
            initialCameraPosition: _kGoogle,
            // on below line we are setting markers on the map
            markers: Set<Marker>.of(_markers),
            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),

          Positioned(  //search input bar
              top:10,
              child: InkWell(
                  onTap: () async {
                    var place = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: googleApikey,
                        mode: Mode.overlay,
                        types: [],
                        strictbounds: false,
                        components: [Component(Component.country, 'np')],
                        //google_map_webservice package
                        onError: (err){
                          print(err);
                        }
                    );

                    if(place != null){
                      setState(() {
                        locationL = place.description.toString();
                      });

                      //form google_maps_webservice package
                      final plist = GoogleMapsPlaces(apiKey:googleApikey,
                        apiHeaders: await GoogleApiHeaders().getHeaders(),
                        //from google_api_headers package
                      );
                      String placeid = place.placeId ?? "0";
                      final detail = await plist.getDetailsByPlaceId(placeid);
                      final geometry = detail.result.geometry!;
                      final lat = geometry.location.lat;
                      final lang = geometry.location.lng;
                     // var newlatlang = LatLng(lat, lang);

                      CameraPosition cameraPosition = new CameraPosition(
                        target: LatLng(lat, lang),
                        zoom: 10,
                      );

                      final GoogleMapController controller = await _controller.future;
                      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

                    }
                  },
                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: Container(
                          padding: EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: ListTile(
                            title:Text(locationL, style: TextStyle(fontSize: 18),),
                            trailing: Icon(Icons.search),
                            dense: true,
                          )
                      ),
                    ),
                  )
              )
          ),
          Positioned(  //search input bar
              top:10,
              child: InkWell(
                  onTap: () async {
                    var place = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: googleApikey,
                        mode: Mode.overlay,
                        types: [],
                        strictbounds: false,
                        components: [Component(Component.country, 'np')],
                        //google_map_webservice package
                        onError: (err){
                          print(err);
                        }
                    );

                    if(place != null){
                      setState(() {
                        locationE = place.description.toString();
                      });

                      //form google_maps_webservice package
                      final plist = GoogleMapsPlaces(apiKey:googleApikey,
                        apiHeaders: await GoogleApiHeaders().getHeaders(),
                        //from google_api_headers package
                      );
                      String placeid = place.placeId ?? "0";
                      final detail = await plist.getDetailsByPlaceId(placeid);
                      final geometry = detail.result.geometry!;
                      final lat = geometry.location.lat;
                      final lang = geometry.location.lng;
                      // var newlatlang = LatLng(lat, lang);

                      CameraPosition cameraPosition = new CameraPosition(
                        target: LatLng(lat, lang),
                        zoom: 10,
                      );

                      final GoogleMapController controller = await _controller.future;
                      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

                    }
                  },
                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: Container(
                          padding: EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: ListTile(
                            title:Text(locationE, style: TextStyle(fontSize: 18),),
                            trailing: Icon(Icons.search),
                            dense: true,
                          )
                      ),
                    ),
                  )
              )
          )
        ],
      ),
      // on pressing floating action button the camera will take to user current location
    );
  }
}

class LocationPageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Page")),
      body: SafeArea(
        child: Center(

        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, levantamentoMorada, entregaMorada,
    latL, lonL, latE, lonE) async {

  var preco = 0;

  //////////////7Calcular preco////////////////////77

  Widget table = Table(
    border: TableBorder.all(width:1, color:Colors.black45), //table border
    children: [

        TableRow(
            children: [
              TableCell(child: Image.asset('Images/ligeiro.jpg')),
              TableCell(child: Text('Ligeiro')),
              TableCell(child: Text('Custo: ${preco}')),
              TableCell(child: new ElevatedButton(onPressed: (){

                showAlertDialogConfirmar(context, levantamentoMorada, entregaMorada,
                    latL, lonL, latE, lonE, preco, 'L');

              }, child: Text('+'))),
            ]
        ),
      TableRow(
          children: [
            TableCell(child: Image.asset('Images/ligeiroMercadorias.jpg')),
            TableCell(child: Text('Ligeiro Mercadorias')),
            TableCell(child: Text('Custo: ${preco}')),
            TableCell(child: new ElevatedButton(onPressed: (){

              showAlertDialogConfirmar(context, levantamentoMorada, entregaMorada,
                  latL, lonL, latE, lonE, preco, 'LM');

            }, child: Text('+'))),
          ]
      ),
      TableRow(
          children: [
            TableCell(child: Image.asset('Images/pesado.jpg')),
            TableCell(child: Text('Pesado')),
            TableCell(child: Text('Custo: ${preco}')),
            TableCell(child: new ElevatedButton(onPressed: (){

              showAlertDialogConfirmar(context, levantamentoMorada, entregaMorada,
                  latL, lonL, latE, lonE, preco, 'P');

            }, child: Text('+'))),
          ]
      ),
      TableRow(
          children: [
            TableCell(child: Image.asset('Images/pesadoMercadorias.jpg')),
            TableCell(child: Text('Pesado Mercadorias')),
            TableCell(child: Text('Custo: ${preco}')),
            TableCell(child: new ElevatedButton(onPressed: (){

              showAlertDialogConfirmar(context, levantamentoMorada, entregaMorada,
                  latL, lonL, latE, lonE, preco, 'PM');

            }, child: Text('+'))),
          ]
      ),
      TableRow(
          children: [
            TableCell(child: Image.asset('Images/reboque.jpg')),
            TableCell(child: Text('Reboque')),
            TableCell(child: Text('Custo: ${preco}')),
            TableCell(child: new ElevatedButton(onPressed: (){

              showAlertDialogConfirmar(context, levantamentoMorada, entregaMorada,
                  latL, lonL, latE, lonE, preco, 'R');

            }, child: Text('+'))),
          ]
      ),
      TableRow(
          children: [
            TableCell(child: Image.asset('Images/reboquepesados.jpg')),
            TableCell(child: Text('Reboque Pesados')),
            TableCell(child: Text('Custo: ${preco}')),
            TableCell(child: new ElevatedButton(onPressed: (){

              showAlertDialogConfirmar(context, levantamentoMorada, entregaMorada,
                  latL, lonL, latE, lonE, preco, 'RP');

            }, child: Text('+'))),
          ]
      ),

    ],);

  Widget voltar = BackButton();

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Escolha a classe de veículo desejado"),
    //content: Text(''),
    actions: [
      table,
      voltar,
    ],

  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogConfirmar(BuildContext context, levantamentoMorada, entregaMorada,
    latL, lonL, latE, lonE, preco, classV) async {

  final _mensagemController = TextEditingController();

  Widget descricao = TextField(
    controller: _mensagemController,
    keyboardType: TextInputType.multiline,
    minLines: 1,//Normal textInputField will be displayed
    maxLines: 2,// when user presses enter it will adapt to it
    decoration: InputDecoration(
      hintText: 'Escreva aqui...',
      hintStyle: TextStyle(
          color: Colors.grey
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    ),
  );

  Widget confirmar = FloatingActionButton(
    child: Text("Sim"),
    onPressed:  () {
      if(_mensagemController.text.isNotEmpty){
      Dados().adicionarTransporteSolicitado(classV, levantamentoMorada,
          entregaMorada, _mensagemController.text, latL, lonL, latE, lonE, preco);


      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Home()));
      } else {
        showAlertDialogErro(context);
      }
    },
  );

  Widget voltar = BackButton();

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Forneça uma descrição detalhada e confirme o transporte - Obrigatório!"),
    content: Text('Detalhes importantes da mercadoria: Largura, Comprimento e Altura total e/ou de cada componente; Peso Total Bruto'),
    actions: [
      descricao,
      confirmar,
      voltar,
    ],

  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogErro(BuildContext context) async {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Descrição Não Fornecida!"),
    content: Text("Descrição Obrigatória"),

  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  Timer(Duration(seconds: 3), () {
    Navigator.of(context, rootNavigator: true).pop();
  },
  );

}

showAlertDialogLocalizacoes(BuildContext context) async {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Insira as localizações"),
    content: Text("Para levantamento localize o dispositivo ou insira manualmente"
        ", para entrega insira manualmente."),

  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  Timer(Duration(seconds: 5), () {
    Navigator.of(context, rootNavigator: true).pop();
  },
  );

}