import 'package:ecommerce_task/cubit/show_product_cubit.dart';
import 'package:ecommerce_task/data/data_resource.dart';
import 'package:ecommerce_task/data/repostory/show_product_repo.dart';
import 'package:ecommerce_task/page/show_product/show_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  DataResource dataResource = DataResource();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColorLight: Colors.white
      ),
        title: 'E-commerce Shopping',
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar', ''), 
        supportedLocales: const [
          Locale('ar', ''), 
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider(
          create: (context) => ShowProductCubit()..loadProduct(),
          child: ShowProduct(
            showProductRepo: ShowProductRepo(dataResource: DataResource()),
            productId : "1"
          ),
        )
      ),
    );
  }
}
