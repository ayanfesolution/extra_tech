import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> listOfSidesImages = [
    'assets/images/xxxrrr1.png',
    'assets/images/xxxrrr2.png',
    'assets/images/xxxrrr3.png',
    'assets/images/xxxrrr4.png',
    'assets/images/xxxrrr5.png',
  ];
  List<ProductListMode> productList = [
    ProductListMode(
        logoPath: 'assets/images/nnpp2.png',
        name: 'NNPC',
        location: 'Eleme, PH'),
    ProductListMode(
      logoPath: 'assets/images/gordon-s-gin.png',
      name: 'GTA MOTOR',
      location: 'USA',
    ),
    ProductListMode(
        logoPath: 'assets/images/hdddd.png',
        name: 'HOLLANDIA',
        location: 'Abuja'),
    ProductListMode(
        logoPath: 'assets/images/NicePng_gta.png',
        name: 'GORDONS',
        location: 'Port Harcourt'),
    ProductListMode(
        logoPath: 'assets/images/pngwing3.png',
        name: 'TOYOTA',
        location: 'Port Harcourt'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Listing',
          style: kCustomTextStyle(
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padded(
        child: ListView(
          children: [
            for (var index = 0; index < productList.length; index++)
              ProductNewWidgetStyle(
                listOfSidesImages: listOfSidesImages,
                productList: productList[index],
              ),
          ],
        ),
      ),
    );
  }
}

class ProductListMode {
  final String logoPath, name, location;

  ProductListMode(
      {required this.logoPath, required this.name, required this.location});
}

class ProductNewWidgetStyle extends StatelessWidget {
  const ProductNewWidgetStyle({
    super.key,
    required this.listOfSidesImages,
    required this.productList,
  });

  final List<String> listOfSidesImages;
  final ProductListMode productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: autoAdjustHeight(15),
      ),
      child: Container(
        height: autoAdjustHeight(90),
        width: double.maxFinite,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFC7C7C7).withOpacity(0.37),
              blurRadius: 12,
              spreadRadius: 0,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            autoAdjustHeight(15),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: autoAdjustHeight(50),
                width: double.maxFinite,
                child: Image.asset(
                  getRandomString(listOfSidesImages),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: autoAdjustHeight(10),
              ),
              child: Padded(
                child: Row(
                  children: [
                    SizedBox(
                      height: autoAdjustHeight(50),
                      width: autoAdjustWidth(50),
                      child: Image.asset(
                        productList.logoPath,
                      ),
                    ),
                    Gap(autoAdjustWidth(14)),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productList.name,
                            style: kCustomTextStyle(
                              size: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            productList.location,
                            style: kCustomTextStyle(
                              size: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
