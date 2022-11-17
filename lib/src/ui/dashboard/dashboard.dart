import 'package:e_comerce_intern_nhat/src/blocs/product_blocs/product_bloc.dart';
import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:e_comerce_intern_nhat/src/resources/product/product_reponsitory.dart';
import 'package:e_comerce_intern_nhat/src/ui/dashboard/widgets/gridviewProduct.dart';
import 'package:e_comerce_intern_nhat/src/ui/product/screens/productManagement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../model/cart/cartItemModel.dart';

class atDashboardScreen extends StatefulWidget {
  const atDashboardScreen({Key? key}) : super(key: key);

  @override
  State<atDashboardScreen> createState() => _atDashboardScreenState();
}

class _atDashboardScreenState extends State<atDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductRepository(),
      child: BlocProvider(
        create: (context) => ProductBloc(
          productRepository: RepositoryProvider.of<ProductRepository>(context),
        ),
        child: SafeArea(
            child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: white,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const SizedBox(width: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Welcome to Giju Shop!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'SFProText',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'The World  Of  Technology Product!',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'SFProText',
                                    fontWeight: FontWeight.w500,
                                    color: gray),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 1,
                        width: 160,
                        color: gray,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 1,
                        width: 120,
                        color: gray,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Products',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SFProText',
                                color: black,
                                height: 1.4),
                            textAlign: TextAlign.right,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          atProductManageMentScreen()));
                            },
                            child: const Text(
                              'See all',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'SFProText',
                                  color: black,
                                  height: 1.4),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 430,
                        child: DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      // border: Border.all(color: violet, width: 5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: white),
                                  child: const TabBar(
                                    indicator: BoxDecoration(
                                      color: black,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.black,
                                    isScrollable: true,
                                    labelStyle: TextStyle(
                                      fontFamily: 'SFProText',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    unselectedLabelStyle: TextStyle(
                                        fontFamily: 'SFProText',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                    labelPadding: EdgeInsets.only(
                                        left: 16, right: 16, top: 0, bottom: 0),
                                    tabs: [
                                      Tab(text: 'Flash Sale'),
                                      Tab(text: 'New Product'),
                                      Tab(text: 'Recommend'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: const TabBarView(
                                      children: [
                                        GridviewProduct(),
                                        GridviewProduct(),
                                        GridviewProduct(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
