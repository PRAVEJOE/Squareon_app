import 'package:get/state_manager.dart';
import 'package:squareone_sam/models/product.dart';
import 'package:squareone_sam/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <TreeItemItem>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
        productList.value = TreeItemItem as List<TreeItemItem>;
    } finally {
      isLoading(false);
    }
  }
}