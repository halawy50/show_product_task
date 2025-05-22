
import 'package:ecommerce_task/data/model/image_model.dart';
import 'package:ecommerce_task/data/model/product_model.dart';

class DataResource {
  List<ImageModel> imageList = [
    ImageModel(imageId: "1", fkProduct: "1", imageUrl: "assets/image1.png"),
    ImageModel(imageId: "2", fkProduct: "1", imageUrl: "assets/image2.png"),
    ImageModel(imageId: "3", fkProduct: "1", imageUrl: "assets/image3.png"),
    //product2
    ImageModel(imageId: "4", fkProduct: "2", imageUrl: "assets/image6.png"),
    ImageModel(imageId: "5", fkProduct: "2", imageUrl: "assets/image7.png"),
    ImageModel(imageId: "6", fkProduct: "2", imageUrl: "assets/image8.png"),
    //product3
    ImageModel(imageId: "7", fkProduct: "3", imageUrl: "assets/image9.png"),
    ImageModel(imageId: "8", fkProduct: "3", imageUrl: "assets/image10.png"),
    ImageModel(imageId: "9", fkProduct: "3", imageUrl: "assets/image11.png"),
    //product4
    ImageModel(imageId: "10", fkProduct: "4", imageUrl: "assets/image12.png"),
    ImageModel(imageId: "11", fkProduct: "4", imageUrl: "assets/image13.png"),
    ImageModel(imageId: "12", fkProduct: "4", imageUrl: "assets/image14.png"),
    //product5
    ImageModel(imageId: "13", fkProduct: "5", imageUrl: "assets/image15.png"),
    ImageModel(imageId: "14", fkProduct: "5", imageUrl: "assets/image16.png"),
    ImageModel(imageId: "15", fkProduct: "5", imageUrl: "assets/image17.png"),
  ];

  List<ProductModel> productsList = [
      ProductModel(
          productId: "1",
          title: "جاكيت رجالي أنيق بقلنسوة مبطن بالفليس",
          defuiltImage: "assets/image1.png",
          mark: "عتيج",
          sku: "6974321040059",
          describe: '''
جاكيت شتوي أنيق للرجال بغطاء قابل للفصل - دافئ، عملي ومتعدد الاستخدامات للأعمال أو الأنشطة الخارجية
المادة: ألياف البوليستر (البوليستر)
المكونات: 100% ألياف البوليستر (البوليستر)
الطول: عادي
طول الكم: كم طويل
نوع الأكمام: أكمام راجلان
        ''',
          fkCategory: "3",
          price: 63.00,
          isDiscount: true,
          percentageDiscount: 60,
          rate: 4.5,
          nameCategory : 'رجالي'

      ),

    ProductModel(
        productId: "2",
        title: "جاكيت رجالي بقلنسوة وبطانة فليس دافئة للشتاء ",
        defuiltImage: "assets/image6.png",
        mark: "عتيج",
        sku: "6974321040059",
        describe: '''
جاكيت شتوي أنيق للرجال بغطاء قابل للفصل - دافئ، عملي ومتعدد الاستخدامات للأعمال أو الأنشطة الخارجية
المادة: ألياف البوليستر (البوليستر)
المكونات: 100% ألياف البوليستر (البوليستر)
الطول: عادي
طول الكم: كم طويل
نوع الأكمام: أكمام راجلان
        ''',
        fkCategory: "3",
        price: 100.00,
        isDiscount: true,
        percentageDiscount: 60,
        rate: 4.5,
        nameCategory : 'رجالي'

    ),

    ProductModel(
        productId: "3",
        title: "جاكيت رجالي بقلنسوة وبطانة فليس دافئة للشتاء  ",
        defuiltImage: "assets/image9.png",
        mark: "عتيج",
        sku: "6974321040059",
        describe: '''
جاكيت شتوي أنيق للرجال بغطاء قابل للفصل - دافئ، عملي ومتعدد الاستخدامات للأعمال أو الأنشطة الخارجية
المادة: ألياف البوليستر (البوليستر)
المكونات: 100% ألياف البوليستر (البوليستر)
الطول: عادي
طول الكم: كم طويل
نوع الأكمام: أكمام راجلان
        ''',
        fkCategory: "3",
        price: 60.00,
        isDiscount: true,
        percentageDiscount: 60,
        rate: 2.5,
        nameCategory : 'رجالي'

    ),

    ProductModel(
        productId: "4",
        title: "جاكيت نسائي بقلنسوة وبطانة فليس دافئة للشتاء ",
        defuiltImage: "assets/image12.png",
        mark: "عتيج",
        sku: "6974321040059",
        describe: '''
جاكيت شتوي أنيق للنساء بغطاء قابل للفصل - دافئ، عملي ومتعدد الاستخدامات للأعمال أو الأنشطة الخارجية
المادة: ألياف البوليستر (البوليستر)
المكونات: 100% ألياف البوليستر (البوليستر)
الطول: عادي
طول الكم: كم طويل
نوع الأكمام: أكمام راجلان
        ''',
        fkCategory: "3",
        price: 70.00,
        isDiscount: true,
        percentageDiscount: 60,
        rate: 4.0,
        nameCategory : 'نسائي'
    ),

    ProductModel(
        productId: "5",
        title: "جاكيت نسائي بقلنسوة وبطانة فليس دافئة للشتاء ",
        defuiltImage: "assets/image15.png",
        mark: "عتيج",
        sku: "6974321040059",
        describe: '''
جاكيت شتوي أنيق للنساء بغطاء قابل للفصل - دافئ، عملي ومتعدد الاستخدامات للأعمال أو الأنشطة الخارجية
المادة: ألياف البوليستر (البوليستر)
المكونات: 100% ألياف البوليستر (البوليستر)
الطول: عادي
طول الكم: كم طويل
نوع الأكمام: أكمام راجلان
        ''',
        fkCategory: "3",
        price: 95.00,
        isDiscount: true,
        percentageDiscount: 60,
        rate: 3.0,
        nameCategory : 'نسائي'

    ),
  ];
}