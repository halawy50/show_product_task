
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showProductAppBar(BuildContext context , String nameCategory){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 5,
          offset: Offset(0, 5),

        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //upBar (backIcon + category / Category)
                  Row(
                    children: [
                        //backIcon
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_ios) ),
                      //category / Category
                      Text("ملابس / ${nameCategory}"),
                    ],
                  ), //end UpBar (backIcon + category / Category)
                  //card
                  IconButton(onPressed: () {
                  }, icon: Image.asset("assets/cart_duoline.png" , width: 24, height: 24,))//endCard
                ],
              ),

          Container(
            padding: EdgeInsets.only(left: 10 , right: 10 ,top: 10 , bottom: 20),
            // decoration: BoxDecoration(
                // color: Colors.white
            // ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(100),
              ),
              padding: EdgeInsets.symmetric(horizontal: 35 , vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المنتج" , style: TextStyle(color: Color(0xFFFE7E00) , fontSize: 15),),
                  Text("|" , style: TextStyle(color: Color(0xFFA6A6A6)),),
                  Text("التقييم" , style: TextStyle(color: Color(0xFF000000) , fontSize: 15),),
                  Text("|" , style: TextStyle(color: Color(0xFFA6A6A6)),),
                  Text("مساعدة" , style: TextStyle(color: Color(0xFF000000) , fontSize: 15),),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}