import 'package:assigment/view/productview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../custumwidget/mytext.dart';

import '../hompage.dart';
import '../them/color.dart';
import '../utils/mystring.dart';
class ProductDetials extends StatefulWidget {
  String image;
  double purch;
  double sel;
  double cur;
  double prof;
  String? brand;


  ProductDetials({required this.image, required this.purch, required this.sel, required this.cur, required this.prof,this.brand});

  @override
  _ProductDetialsState createState() => _ProductDetialsState();
}

class _ProductDetialsState extends State<ProductDetials> {
  List<String> _carouselImages = ["https://d1ojphegpburrh.cloudfront.net/media/images/product/None/1388/%E0%A6%B8%E0%A6%9C_9.png","https://d1ojphegpburrh.cloudfront.net/media/images/product/None/1388/%E0%A6%B8%E0%A6%9C_9.png"];
  late String product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GTheme.backgraound,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Get.offAll(HomePage());
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: GTheme.iconcolor,
                        )),
                  ),
                  NormalTextWidget(
                    textName: Mystring.productDetalis,
                    textFontSize: 15,
                    textColor: GTheme.textcolor,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                ),
                child: TextField(

                  decoration: InputDecoration(
                      hintText: Mystring.search,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),

                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),


                      suffixIcon: IconButton(
                        onPressed: () {
                          Get.to(ProductView(), arguments: product);
                        },
                        icon: Icon(Icons.search,color: GTheme.iconcolor,),
                      )),
                  onChanged: (newvalue) {
                    product = newvalue;
                  },
                ),
              ),
              SizedBox(height: 10,),
              AspectRatio(
                aspectRatio: 2.5,
                child: CarouselSlider(
                    items: _carouselImages
                        .map((item) => Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.fitWidth)),
                      ),
                    ))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay:true,
                      enlargeCenterPage: false,
                      height: 300,

                      viewportFraction: 0.75,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayInterval: Duration(seconds: 3),



                    )),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NormalTextWidget(textName: "জোড়া ইলিশ বিরই চাল- ৫০ কেজি", textFontSize: 24,textColor: GTheme.text1,),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,0,0),
                    child: NormalTextWidget(textName: "ব্রান্ডঃ ${widget.brand}", textFontSize: 14,textColor: GTheme.text1,),
                  ),
                  SizedBox(width: 5,),
                  CircleAvatar(
                      backgroundColor: GTheme.text2,
                      radius: 5

                  ),
                  SizedBox(width: 2,),

                  NormalTextWidget(textName: "ডিস্ট্রিবিউটরঃ ",textFontSize: 14,textColor: GTheme.text1,),
                  Text("মোঃ মোবারাক হোসেন",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                  SizedBox(height: 20,),



                ],
              ),
              SizedBox(height: 20,),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    width: 300,
                    height: 166,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,


                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NormalTextWidget(textName: Mystring.purchas1, textFontSize: 20,textColor: GTheme.text2,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: NormalTextWidget(textName: "৳ ${widget.purch}", textFontSize: 20,textColor: GTheme.text2,),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,


                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NormalTextWidget(textName: Mystring.sel1, textFontSize: 20,textColor: Colors.black,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: NormalTextWidget(textName: "৳ ${widget.sel}", textFontSize: 20,textColor: Colors.black,),
                            )
                          ],
                        ),
                        Text("----------------------------------------------------------------------------",style: TextStyle(color: GTheme.text1),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,


                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NormalTextWidget(textName: Mystring.prof, textFontSize: 20,textColor: Colors.black,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: NormalTextWidget(textName: "৳ ${widget.prof}", textFontSize: 20,textColor: Colors.black,),
                            )
                          ],
                        ),



                      ],
                    ),

                  ),

                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 120),
                        child: Image(image: AssetImage("images/assets/icons.png"),width: 90,height: 90,),
                      )
                  )

                ],

              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: NormalTextWidget(textName: "বিস্তারিত", textFontSize: 20,textColor: GTheme.text1,),
              ),
              Padding(
                padding:  EdgeInsets.fromLTRB(26,20,10,20),
                child: NormalTextWidget(textName: "জীবের মধ্যে সবচেয়ে সম্পূর্ণতা মানুষের। কিন্তু সবচেয়ে অসম্পূর্ণ হয়ে সে জন্মগ্রহণ করে। বাঘ ভালুক তার জীবনযাত্রার পনেরো- আনা মূলধন নিয়ে আসে প্রকৃতির মালখানা থেকে। জীবরঙ্গভূমিতে মানুষ এসে দেখা দেয় দুই শূন্য হাতে মুঠো বেঁধে।", textFontSize: 16,textColor: GTheme.text1,),
              )





            ],
          ),
        ),
      ),

    );
  }
}
