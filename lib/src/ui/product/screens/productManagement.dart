import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_intern_nhat/src/model/product/productModel.dart';
import 'package:e_comerce_intern_nhat/src/ui/product/screens/createProduct.dart';
import 'package:e_comerce_intern_nhat/src/ui/product/screens/productDetail.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import '../../../constants/colors.dart';

class atProductManageMentScreen extends StatefulWidget {
  atProductManageMentScreen({Key? key}) : super(key: key);
  @override
  _atProductManageMentScreen createState() => _atProductManageMentScreen();
}

class _atProductManageMentScreen extends State<atProductManageMentScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  late List<ProductModel> listProduct = [];
  late List<ProductModel> listSticker = [];
  late List<ProductModel> listWashiTape = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.only(left: 14, right: 14, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Iconsax.back_square,
                          size: 28,
                          color: violet,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Form(
                        key: searchFormKey,
                        child: Container(
                          width: 200 + 100 - 3,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.topCenter,
                          child: TextFormField(
                              style: const TextStyle(
                                  fontFamily: 'BeVietnamPro',
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                              //validator
                              validator: (email) {},
                              controller: searchController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                hintStyle: TextStyle(
                                    fontFamily: 'BeVietnamPro',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: black.withOpacity(0.5)),
                                hintText: "Write the name or code of product ",
                                filled: true,
                                fillColor: blueLight,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 0,
                                  height: 0,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        'Products Management',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Recoleta',
                            fontWeight: FontWeight.w500,
                            color: violet),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => atCreateProduct())));
                        },
                        child: const Icon(
                          Iconsax.add_square,
                          size: 28,
                          color: violet,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
