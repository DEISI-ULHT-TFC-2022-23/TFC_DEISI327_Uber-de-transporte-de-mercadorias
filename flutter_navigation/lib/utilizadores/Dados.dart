import 'dart:math';

class Dados{

static var utilizadorAtivo;
static var transporteAtual;

double calculateDistance(lat1, lon1, lat2, lon2){
var p = 0.017453292519943295;
var a = 0.5 - cos((lat2 - lat1) * p)/2 +
cos(lat1 * p) * cos(lat2 * p) *
(1 - cos((lon2 - lon1) * p))/2;
return 12742 * asin(sqrt(a));
}

double preco(classV, double distancia){
double preco = 0.0;

if(classV == 'B'){
preco = (3*distancia);
}else if(classV == 'BE'){
preco = (4*distancia);
}else if(classV == 'C1'){
preco = (5*distancia);
}else if(classV == 'C'){
preco = (6*distancia);
}else if(classV == 'C1E'){
preco = (7*distancia);
}else if(classV == 'CE'){
preco = (8*distancia);
}

return preco;
}

}