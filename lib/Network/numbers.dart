import 'package:menuapp/Network/network.dart';

const API_BASE = 'https://corona.lmao.ninja/v2';

class numberModel {
  Future<dynamic> getAllNumbers(String endPoint) async {
    NetworkHelper networkHelper = NetworkHelper("$API_BASE/$endPoint");
    List<dynamic> numberData = await networkHelper.getData();
    return numberData;
  }

  Future<dynamic> getWorldNumbers(String endPoint) async {
    NetworkHelper networkHelper = NetworkHelper("$API_BASE/$endPoint");
    var numberData = await networkHelper.getData();
    return numberData;
  }
}
