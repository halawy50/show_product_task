
import 'package:ecommerce_task/data/data_resource.dart';
import 'package:ecommerce_task/data/model/image_model.dart';
import 'package:ecommerce_task/data/model/product_model.dart';

class ShowProductRepo {
  DataResource dataResource;
  ShowProductRepo({required this.dataResource});

  ProductModel getProductById(String productId){
    return dataResource.productsList.firstWhere((element) => element.productId == productId,);
  }

  List<ProductModel> getOtherProduct(String productId){
    List<ProductModel> otherProduct= [];
    for(ProductModel product in dataResource.productsList){
      if(productId==product.productId) continue;
      else otherProduct.add(product);
    }
    return otherProduct;
  }

  List<ImageModel> getImagesProduct(String productId){
    List<ImageModel> imagesProduct= [];
    for(ImageModel image in dataResource.imageList){
      if(image.fkProduct==productId){
        print("object");
        imagesProduct.add(image);
      }
    }
    return imagesProduct;
  }

}