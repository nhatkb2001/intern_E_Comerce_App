import 'dart:io';
import 'dart:math';
import 'package:e_comerce_intern_nhat/src/blocs/cart_blocs/cart_state.dart';
import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:e_comerce_intern_nhat/src/resources/cart/cart_responsitory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';
//import Firebase stuffs
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../blocs/cart_blocs/cart_bloc.dart';

class atCartScreen extends StatefulWidget {
  atCartScreen({Key? key}) : super(key: key);

  @override
  _atCartScreenState createState() => _atCartScreenState();
}

class _atCartScreenState extends State<atCartScreen> {
  _atCartScreenState();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CartRepository(),
      child: BlocProvider(
        create: (context) => CartBloc(
          cartRepository: RepositoryProvider.of<CartRepository>(context),
        ),
        child: Scaffold(
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 30,
              ),
              // height: 174,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -15),
                    blurRadius: 20,
                    color: white.withOpacity(0.15),
                  )
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Iconsax.wallet_check,
                            size: 24,
                            color: black,
                          ),
                        ),
                        Spacer(),
                        Text("Add voucher code"),
                        const SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios, size: 12, color: black)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Total:\n",
                            children: [
                              TextSpan(
                                text: "\$240",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: 190,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Check out',
                                  style: TextStyle(color: white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: Stack(children: [
              Container(
                decoration: BoxDecoration(color: white),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Container(
                      padding: EdgeInsets.only(left: 28 - 6),
                      child: const Text(
                        "My Cart",
                        style: TextStyle(
                            fontFamily: "SFProText",
                            fontSize: 24.0,
                            color: black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        height: 600 - 14 - 181,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: BlocBuilder<CartBloc, CartState>(
                              builder: ((context, state) {
                            if (state is Success) {
                              return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Dismissible(
                                      direction: DismissDirection.endToStart,
                                      onDismissed: (direction) {
                                        setState(() {});
                                      },
                                      background: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFE6E6),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          children: [
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      key: Key('1'),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 88,
                                            child: AspectRatio(
                                              aspectRatio: 0.88,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F6F9),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Container(
                                                  height: 80,
                                                  width: 80,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "lib/src/constants/images/clockImage.png"),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Apple Watch',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16),
                                                maxLines: 2,
                                              ),
                                              SizedBox(height: 10),
                                              Text.rich(
                                                TextSpan(
                                                  text: "\$${0}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: black),
                                                  children: [
                                                    TextSpan(
                                                        text: " x${2}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              );
                            }
                            if (state is Failed) {
                              return Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Please check your connection",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w600,
                                    color: black,
                                  ),
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
                                      child: CircularProgressIndicator(
                                          color: white)),
                                  SizedBox(width: 16),
                                  Text(
                                    "Please Wait...",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w600,
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
