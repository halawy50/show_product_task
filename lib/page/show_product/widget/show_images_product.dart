
import 'package:ecommerce_task/data/model/image_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showImagesProduct({required List<ImageModel> imagesProduct , required void changeImage(int currentIndex)}){
  PageController _pageController = PageController();

  return Container(
    width: double.infinity,
    height: 250,
    child: PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
        itemCount: imagesProduct.length,
        itemBuilder: (context , index) {
          return Image.asset("${imagesProduct[index].imageUrl}" , width: double.infinity, height: 200,);
        },
      onPageChanged: (index){
          changeImage(index);
      },
    ),
  );
}