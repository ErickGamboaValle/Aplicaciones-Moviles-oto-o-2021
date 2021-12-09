import 'package:http/http.dart';

class ProductsRepository {
  //sigleton
  static final ProductsRepository _ProductsRepository =
      ProductsRepository._internal();
  factory ProductsRepository() {
    return _ProductsRepository;
  }
  ProductsRepository._internal();
  final String baseURL =
      "https://api.sheety.co/567355b48b16449d68593f7d9deefa4c/productosData/";

  Future<dynamic> getProductos(String resource) async {
    try {
      Response response = await get(Uri.parse(baseURL + resource));
      if (response.statusCode == 200) {
        //jsonDecode
      } else {
        //hacer algo
      }
    } on Exception catch (ez, stackTrace) {
      //truena el request
      print("Error: $resource >> ${ez.toString()}\n ${stackTrace}");
    }
  }
}
