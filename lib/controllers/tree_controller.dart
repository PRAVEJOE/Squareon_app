import 'package:get/state_manager.dart';
import 'package:squareone_sam/models/product.dart';
import 'package:squareone_sam/services/remote_services.dart';

class TreeController extends GetxController {
  var isLoading = true.obs;
  var productList = List<TreeItemItem>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if(products!=null){
        print(products);
      productList.value=products.data.treeItems[3].items;
    }
      }finally {
      isLoading(false);
    }
  }
}