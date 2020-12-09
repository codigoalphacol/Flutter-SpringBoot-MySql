import 'dart:convert';
import 'package:http/http.dart' as http;

class DataBaseHelper {
  //Funcion para agregar un producto a la BD
  Future<http.Response> addDataProducto(String nameController,
      String quantityController, String priceController) async {
    var url = 'http://192.168.1.38:9191/addProduct';

    Map data = {
      'name': '$nameController',
      'quantity': '$quantityController',
      'price': '$priceController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //function for update or put
  Future<http.Response> editarProduct(String id, String nameController,
      String quantityController, String priceController) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.38:9191/update';

    Map data = {
      'id': '$a',
      'name': '$nameController',
      'quantity': '$quantityController',
      'price': '$priceController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
  // void editarProduct(
  //     String _id, String name, String price, String stock) async {

  //   String myUrl = "http://192.168.1.56:3000/product/$_id";
  //   http.put(myUrl, body: {
  //     "name": "$name",
  //     "price": "$price",
  //     "stock": "$stock"
  //   }).then((response) {
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

  //Funcion para agregar un producto a la BD
  Future<http.Response> removeRegister(String id) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.38:9191/delete/$a';

    var response =
        await http.delete(url, headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }
}
