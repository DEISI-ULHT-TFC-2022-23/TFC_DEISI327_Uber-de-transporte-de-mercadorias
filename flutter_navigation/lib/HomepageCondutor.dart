import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/AlterarContaCondutor.dart';
import 'package:flutter_navigation/Classificacao.dart';
import 'package:flutter_navigation/ListarTransportesCondutor.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Dados.dart';
import 'Login.dart';
import 'SuporteCondutor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageCondutor createState() => _HomePageCondutor();
}

class _HomePageCondutor extends State<HomePage> {

  var destino;
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {

    getUserCurrentLocation().then((value) async {

      print(value.latitude.toString() +" "+value.longitude.toString());

      Dados().utilizadorAtivo.atualizarLocalizacao(value.latitude.toString(), value.longitude.toString());
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

    if(Dados().utilizadorAtivo.disponivel==true && Dados().utilizadorAtivo.emServico ==true){
      if(Dados().utilizadorAtivo.getServicoEmTransporte.estadoLevantamento==false){

        destino = LatLng(Dados().utilizadorAtivo.getServicoEmTransporte().latL,
            Dados().utilizadorAtivo.getServicoEmTransporte().longL);
        getPolyPoints();
        _markers.add(
            Marker(
              markerId: MarkerId("2"),
              position: LatLng(destino.latitude, destino.longitude),
              infoWindow: InfoWindow(
                title: 'Levantamento',
              ),
            )
        );
      }
      if(Dados().utilizadorAtivo.getServicoEmTransporte.estadoLevantamento==true){
        destino = LatLng(Dados().utilizadorAtivo.getServicoEmTransporte().latE,
            Dados().utilizadorAtivo.getServicoEmTransporte().longE);
        getPolyPoints();
        _markers.add(
            Marker(
              markerId: MarkerId("3"),
              position: LatLng(destino.latitude, destino.longitude),
              infoWindow: InfoWindow(
                title: 'Entrega',
              ),
            )
        );
      }

    }
    ;
  }

  void getPolyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();
    var partida = PointLatLng(Dados().utilizadorAtivo.latAtual, Dados().utilizadorAtivo.lonAtual);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyBPCxZHYUS5qWy7J40Tu1wfMvzbv9F_Re4', partida, PointLatLng(destino.latitude, destino.longitude),
    );

    if(result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) => polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
    }

    setState(() {
    });

  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });

    if(index==0){
      Dados().utilizadorAtivo.atualizarDisponibilidade();
      showAlertDialogDisponibilidade(context, Dados().utilizadorAtivo.getDisponibilidade);
      Timer(Duration(seconds: 5), () {
        showAlertDialogTransporte(context, Dados().getListaTranspsortes().first);
      });
    }

    if(index==1){
      showAlertDialogLevantamento(context, Dados().utilizadorAtivo.fazerLevantamento());
    }

    if(index == 2){
      showAlertDialogEntrega(context, Dados().utilizadorAtivo.fazerEntrega());
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
    return Scaffold(

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
              title: const Text('Página de Serviço'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Classificação'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Classificacao()),
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
                  MaterialPageRoute(builder: (context) => ListarTransportesCondutor()),
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
                  MaterialPageRoute(builder: (context) => SuporteCondutor()),
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
                  MaterialPageRoute(builder: (context) => AlterarContaCondutor()),
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
            icon: Icon(Icons.local_shipping),
            label: 'Disponibilidade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_location_outlined),
            label: 'Levantamento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Entrega',
          ),
        ],
        currentIndex: _selectedIndex,
       // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),


      appBar: AppBar(
        title: Text('Uber de Mercadorias'),
        actions: [
          Image(image: AssetImage('Images/playstore.png'))
        ],
      ),

      body: Container(
        child: SafeArea(
          // on below line creating google maps
          child: GoogleMap(
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
            polylines: {
              Polyline(
                polylineId: PolylineId("route"),
                points: polylineCoordinates,
                color: Colors.blue,
                width: 6,
              );
              }
            },
          ),
        ),
      ),
      // on pressing floating action button the camera will take to user current location
    );
  }
}

showAlertDialogDisponibilidade(BuildContext context, mensagem) async {

  var msg = mensagem.toString();

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Disponibilidade:"),
    content: Text("$msg"),

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

showAlertDialogLevantamento(BuildContext context, mensagem) async {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Estado de Levantamento de Mercadorias:"),
    content: Text(mensagem),

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

showAlertDialogEntrega(BuildContext context, mensagem) async {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Estado de Entrega de Mercadorias:"),
    content: Text('$mensagem'),

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

showAlertDialogTransporte(BuildContext context,Transporte transporte) async {

  var levantamento = transporte.levantamento;
  var entrega = transporte.entrega;

  Widget aceitarButton = FloatingActionButton(
    child: Text("Sim"),
    onPressed:  () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    },
  );
  Widget rejeitarButton = FloatingActionButton(
    child: Text("Não"),
    onPressed:  () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Aceita o transporte solicitado?"),
    content: Text('Local de Levantamento: $levantamento'
        'Local de Entrega: $entrega'),
    actions: [
      aceitarButton,
      rejeitarButton,
    ],

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