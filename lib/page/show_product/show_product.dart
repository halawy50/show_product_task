import 'dart:ffi';

import 'package:ecommerce_task/cubit/show_product_cubit.dart';
import 'package:ecommerce_task/data/data_resource.dart';
import 'package:ecommerce_task/data/model/image_model.dart';
import 'package:ecommerce_task/data/model/product_model.dart';
import 'package:ecommerce_task/data/repostory/show_product_repo.dart';
import 'package:ecommerce_task/page/show_product/widget/dot_indecator.dart';
import 'package:ecommerce_task/page/show_product/widget/other_product.dart';
import 'package:ecommerce_task/page/show_product/widget/show_images_product.dart';
import 'package:ecommerce_task/page/show_product/widget/show_product_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShowProduct extends StatelessWidget {
  final ShowProductRepo showProductRepo;
  final String productId;
  const ShowProduct({super.key, required this.showProductRepo , required this.productId});

  @override
  Widget build(BuildContext context) {
    List<ImageModel> imageList = showProductRepo.getImagesProduct(productId);
    ProductModel product = showProductRepo.getProductById(productId);
    List<ProductModel> otherProducts = showProductRepo.getOtherProduct(productId);

     return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [

                    //AppBar
                    showProductAppBar(context , product.nameCategory),

                    SizedBox(height: 20,),

                    //Show Images
                    showImagesProduct(imagesProduct: imageList,
                      changeImage: (currentIndex) {
                        context.read<ShowProductCubit>().changeIndexImages(currentIndex);
                      },),

                    SizedBox(height: 20,),

                    //Favourite and ShareProduct
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {},
                            icon: Image.asset("assets/share-outline.png" , width: 30, height: 30,)
                        ),

                        BlocBuilder<ShowProductCubit, ShowProductState>(
                          builder: (context, state) {
                            if (state is ShowProductLoaded) {
                              return IconButton(
                                  onPressed: () => context.read<ShowProductCubit>().toggleFavourite(),
                                  icon:
                                  state.isFavourite ?
                                  Image.asset("assets/heart_action.png" , width: 30, height: 30,):
                                  Image.asset("assets/heart.png" , width: 30, height: 30,)
                              );
                            }
                            return Container(); // حالة مبدئية
                          },

                        )
                      ],
                    ),

                    SizedBox(height: 20,),

                    //Dot Indecator
                    BlocBuilder<ShowProductCubit, ShowProductState>(
                      builder: (context, state) {
                        if (state is ShowProductLoaded) {
                          return dotIndicators(
                            imagesProduct: imageList,
                            currentIndex: state.currentIndex,
                          );
                        }
                        return SizedBox(); // يمكنك عرض مؤشر تحميل مثلاً لو أردت
                      },
                    ),

                    SizedBox(height: 20,),

                    //Title
                    Text("${product.title}" , style: TextStyle(color: Colors.black , fontSize: 18),),

                    SizedBox(height: 20,),

                    //price and Percentage
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Discount
                            product.isDiscount?
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                "${product.price} KWD",
                                style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  color: Colors.red,
                                ),
                              ),) :Container(),

                            //price
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                "${(product.price * (1 - (product.percentageDiscount / 100))).toStringAsFixed(2)} KWD",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ), //end (price)

                        //Percentage
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("${product.percentageDiscount}%" , style: TextStyle(fontSize: 18 , color: Colors.white),),
                        ) // end Percentage
                      ],
                    ),

                    SizedBox(height: 10,),

                    //Mark , Rate and SKU
                    Column(
                      children: [
                        Divider(color: Color(0xFFAEADAD), endIndent: 0.2, thickness: 0.2,),
                        //Mark
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("الماركة :${product.mark}" , style: TextStyle(color: Colors.black , fontSize: 16),),
                            //showMore
                            Row(
                              children: [
                                Text("المزيد" , style: TextStyle(color: Colors.black , fontSize: 16),),
                                Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Icon(Icons.arrow_back_ios , size: 15,)
                                ),
                              ],
                            )

                          ],
                        ), //end Mark
                        SizedBox(height: 5,),
                        //rate and SKU
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //rate
                            Row(
                              children: [
                                IgnorePointer(
                                  child: RatingBar.builder(
                                    initialRating: product.rate,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    unratedColor: Colors.grey.shade300,
                                    onRatingUpdate: (rating) {},
                                  ),
                                ),

                                SizedBox(width: 5,),


                                Text(
                                  "3 تقييمات",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationStyle: TextDecorationStyle.solid,
                                      color: Color(0xFF4B4B4B)
                                  ),
                                )

                              ],
                            ), //endRate
                            //SKu
                            Text("SKU : ${product.sku}" , style: TextStyle( color: Colors.black , fontSize: 14), ) //endSKU
                          ],
                        ), //end rate and SKU
                        Divider(color: Color(0xFFAEADAD), endIndent: 0.2, thickness: 0.2,),
                      ],
                    ), //end Mark , Rate and SKU

                    SizedBox(height: 10,),

                    //Describe
                    BlocBuilder<ShowProductCubit, ShowProductState>(
                      builder: (context, state) {
                        if(state is ShowProductLoaded){
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<ShowProductCubit>().toggleDescribe();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("الوصـف" , style: TextStyle(color: Colors.black , fontSize: 20),),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          child: Icon(
                                            state.isShowDescribe?
                                            Icons.keyboard_arrow_down_sharp:
                                            Icons.keyboard_arrow_up_sharp
                                            , size: 30,
                                          )
                                      ),

                                    )
                                  ],
                                ),
                              ), //end ArrowDescribe

                              SizedBox(height: 5,),

                              state.isShowDescribe?
                              //Describe Text
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text("${product.describe}" ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14
                                      ),
                                      textAlign: TextAlign.start,
                                    )
                                ),
                              ): Container(),
                            ],
                          );
                        }
                        return Column();
                      },
                    ), //end Describe

                    //other Products
                    Column(
                      children: [
                        //stack
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Divider(),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text("عناصر مماثلة" ,style: TextStyle(color: Colors.black , fontSize: 20),),
                            )
                          ],
                        ),


                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: otherProducts.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 20,
                            childAspectRatio:0.4,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: BlocProvider(
                                                create: (context) => ShowProductCubit()..loadProduct(),
                                                child: ShowProduct(
                                                    showProductRepo: ShowProductRepo(dataResource: DataResource()),
                                                  productId: otherProducts[index].productId,
                                                ),
                                              )
                                          ),
                                    ),
                                  );

                                },
                                child: otherProduct(product: otherProducts[index]));
                          },
                        )


                      ],
                    ), //end Stack

                    SizedBox(height: 60,)

                  ],
                ),),
            ),

            //BuyNow
            BlocBuilder<ShowProductCubit, ShowProductState>(
              builder: (context, state) {

                if(state is ShowProductLoaded){
                  return Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                              offset: Offset(5, 0),
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<ShowProductCubit>().incrementQuantity();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE3E3E3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                                    child: Text("+" , style: TextStyle(color: Colors.black , fontSize: 20)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                                  child: Text("${state.quantityNeed}" , style: TextStyle(color: Colors.black , fontSize: 20)),
                                ),


                                InkWell(
                                  onTap: () {
                                    context.read<ShowProductCubit>().decrementQuantity();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE3E3E3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                                    child: Text("-" , style: TextStyle(color: Colors.black , fontSize: 20)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('تم اضافة المنتج الي السلة'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFE7E00),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text("اشتري الآن",style: TextStyle(color: Colors.white , fontSize: 20),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),

          ],
        )
      ),
    );
  }
}
