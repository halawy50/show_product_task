
import 'package:ecommerce_task/data/model/image_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dotIndicators({
  required int currentIndex ,
  required List<ImageModel> imagesProduct
}){
  return  // Dot Indicators
    Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(imagesProduct.length, (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: currentIndex == index ? 12 : 12,
            height: currentIndex == index ? 12 : 12,
            decoration: BoxDecoration(
              color: currentIndex == index ? Color(0xFFFE7E00) : Color(0xFFFE7E00).withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          );
        }));
}