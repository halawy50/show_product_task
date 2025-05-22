import 'package:ecommerce_task/data/model/product_model.dart';
import 'package:flutter/material.dart';

Widget otherProduct({required ProductModel product}) {
  final discountedPrice =
  (product.price * (1 - (product.percentageDiscount / 100))).toStringAsFixed(2);

  return Container(
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    height: 750,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          color: Colors.white,
          child: Image.asset(
            product.defuiltImage,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),

        SizedBox(height: 10,),

        if (product.isDiscount)
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              "${product.price} KWD",
              style: const TextStyle(
                fontSize: 15,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.red,
                color: Colors.red,
              ),
            ),
          ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            "$discountedPrice KWD",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),

        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/heart.png",
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFE7E00),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "اشتري الأن",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),

      ],
    ),
  );
}
