import 'dart:io';

import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import widgets

import 'dart:async';
//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';

class profileCenterScreen extends StatefulWidget {
  profileCenterScreen({Key? key}) : super(key: key);

  @override
  _profileCenterScreenState createState() => _profileCenterScreenState();
}

class _profileCenterScreenState extends State<profileCenterScreen> {
  // final String? uid = controllers.currentUserId;

  _profileCenterScreenState();

  FirebaseAuth auth = FirebaseAuth.instance;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(color: white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            Container(
              // padding: EdgeInsets.only(top: 36, left: 22),
              alignment: Alignment.topLeft,
              width: 200,
              height: 200,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  image: DecorationImage(
                    image: AssetImage("lib/src/constants/images/avatar.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Peter Nguyen',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
                SizedBox(height: 4),
                Text(
                  'peternguyen123@gmail.com',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                )
              ],
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.only(bottom: 40 + 12 + 24),
                alignment: Alignment.center,
                child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    height: 48,
                    width: 200,
                    decoration: BoxDecoration(
                      // color: getColor(purpleDark, purpleDark.withOpacity(0.3)),
                      color: violet,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                        BoxShadow(
                          color: black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 64,
                          offset: Offset(15, 15),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            child:
                                Icon(Iconsax.logout, size: 24, color: white)),
                        SizedBox(width: 12),
                        Text(
                          "Log out",
                          style: TextStyle(
                            color: white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 12)
                      ],
                    )))
          ],
        ),
      )
    ]));
  }
}
