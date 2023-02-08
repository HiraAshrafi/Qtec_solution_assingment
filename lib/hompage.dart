
import 'package:assigment/them/color.dart';
import 'package:assigment/utils/mystring.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'view/productview.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String product;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: GTheme.backgraound,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 60,),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(18.0)
                  ),
                ),
                child: TextField(



                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),

                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      hintText: Mystring.search,
                      suffixIcon: IconButton(
                        onPressed: (){
                          Get.to(ProductView(),arguments: product);
                        },
                        icon: Icon(Icons.search,color: GTheme.iconcolor,),
                      )
                  ),
                  onChanged: (newvalue){
                    product = newvalue;
                  },
                ),
              ),
              // ElevatedButton(
              //     onPressed: (){
              //       Get.to(ProductView(),arguments: product);
              //     },
              //     child: Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
  }
}
