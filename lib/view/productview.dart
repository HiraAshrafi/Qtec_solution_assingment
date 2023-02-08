
import 'package:assigment/view/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/productcontroller.dart';
import '../custumwidget/mytext.dart';
import '../them/color.dart';
import '../utils/mystring.dart';
class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late String product;
  SampleController sampleController=Get.put(SampleController());


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 5) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: GTheme.backgraound,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
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
            SizedBox(height: 20,),
            Obx(() => sampleController.isLoading.value
                ? Center(
              child: CircularProgressIndicator(),
            ): Expanded(
              child: GridView.builder(

                itemCount:sampleController.sampleList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: (itemWidth / itemHeight),

                ),
                itemBuilder: (context, index) {

                  return InkWell(
                    onTap: (){
                      Get.offAll(()=>
                          ProductDetials(image: sampleController.sampleList[index].image.toString(),
                            purch:sampleController.sampleList[index].charge.currentCharge ,
                            sel: sampleController.sampleList[index].charge.sellingPrice,
                            cur: sampleController.sampleList[index].charge.currentCharge,
                            prof: sampleController.sampleList[index].charge.currentCharge,
                            brand: sampleController.sampleList[index].brand.name,
                          )
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,10,20,0),
                      child: Container(

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Card(
                              child:Image(
                                image:NetworkImage(sampleController.sampleList[index].image.toString()),
                              ),
                            ),
                            SizedBox(height:20 ,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NormalTextWidget(textName: "মোজাম্মেল সিদ্ধ খুদ- ৫০ কেজি", textFontSize: 14,textColor: GTheme.text1,),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: NormalTextWidget(textName: Mystring.purchas, textFontSize: 8,textColor: GTheme.text1,),
                                ),
                                NormalTextWidget(textName:"৳ ${sampleController.sampleList[index].charge.currentCharge.toString()}", textFontSize: 14,textColor: GTheme.text2,),
                                SizedBox(width: 1,),
                                Text("৳${sampleController.sampleList[index].charge.currentCharge.toString()}",style: TextStyle(decoration: TextDecoration.lineThrough,color: GTheme.text2,fontSize: 12),)

                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: NormalTextWidget(textName: Mystring.sel, textFontSize: 8,textColor: GTheme.text1,),
                                ),
                                NormalTextWidget(textName: "৳${sampleController.sampleList[index].charge.sellingPrice}", textFontSize: 14,textColor: GTheme.text1,),

                                NormalTextWidget(textName: Mystring.prof, textFontSize: 8,textColor: GTheme.text1,),
                                NormalTextWidget(textName: "৳${sampleController.sampleList[index].charge.profit}", textFontSize: 10,textColor: GTheme.text1,),





                              ],
                            ),
                            SizedBox(height: 15,),
                            Expanded(
                              child: CircleAvatar(
                                backgroundColor:GTheme.cir1,
                                radius: 15,
                                child: Icon(Icons.add,color: Colors.white,),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
            )


          ],
        ),
      ),
    );
  }
}
