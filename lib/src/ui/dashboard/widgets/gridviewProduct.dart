import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_intern_nhat/src/blocs/product_blocs/product_bloc.dart';
import 'package:e_comerce_intern_nhat/src/blocs/product_blocs/product_state.dart';
import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:e_comerce_intern_nhat/src/model/product/productModel.dart';
import 'package:e_comerce_intern_nhat/src/resources/product/product_reponsitory.dart';
import 'package:e_comerce_intern_nhat/src/ui/product/screens/productDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../blocs/product_blocs/product_events.dart';

class GridviewProduct extends StatefulWidget {
  const GridviewProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<GridviewProduct> createState() => _GridviewProductState();
}

class _GridviewProductState extends State<GridviewProduct> {
  final id = FirebaseAuth.instance.currentUser!.uid.toString();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(UploadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: ((context, state) {
        if (state is Success) {
          List<ProductModel> productList = state.productsList;
          return Container(
            color: blueLight,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const AtProductDetail())));
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Image.network(
                                productList[index].images[0].toString()),
                          ),
                        ),
                        Text(
                          productList[index].name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SFProText',
                              color: black,
                              height: 1.4),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Series 3 GPS',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SFProText',
                              color: black,
                              height: 1.4),
                          textAlign: TextAlign.right,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8, left: 8, bottom: 4),
                          child: Row(
                            children: [
                              Text(
                                "\$" + productList[index].price,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'SFProText',
                                    color: black,
                                    height: 1.4),
                                textAlign: TextAlign.right,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection('cart')
                                      .where('ownerId', isEqualTo: id)
                                      .get()
                                      .then((value) {
                                    FirebaseFirestore.instance
                                        .collection('cart')
                                        .doc(value.docs.first.id)
                                        .update({
                                      'listIdProducts': FieldValue.arrayUnion(
                                          [productList[index].id])
                                    });
                                  });
                                },
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                    color: black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                  ),
                                  child: const Center(
                                      child: Icon(Iconsax.shopping_cart,
                                          size: 16, color: white)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        }
        if (state is Failed) {
          return SizedBox(
            height: 48,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "There is notthing to show",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                    color: white,
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox(
          height: 48,
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(color: white)),
              SizedBox(width: 16),
              Text(
                "Please Wait...",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
