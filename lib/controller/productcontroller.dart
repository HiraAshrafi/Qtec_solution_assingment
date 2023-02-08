import 'package:get/get.dart';


import '../model/datamodel.dart';
import '../service/apiserivec.dart';


class SampleController  extends GetxController
{
  final sampleList = List<Result>.empty(growable: true).obs;
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    getProducts();
  }

  void getProducts() async{
    var news = await ApiService().getproducts(Get.arguments);

    try {
      if(news != null){
        sampleList.addAll(news.data.products.results);
      }
    } finally {
      isLoading(false);
    }
  }

}