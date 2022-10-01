import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AtProductDetail extends StatefulWidget {
  const AtProductDetail({Key? key}) : super(key: key);

  @override
  State<AtProductDetail> createState() => _AtProductDetailState();
}

class _AtProductDetailState extends State<AtProductDetail> {
  PageController pageController = PageController();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Container(color: white),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 330,
                  width: 360,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: pageController,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                top: 50, left: 24, bottom: 90, right: 24),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "lib/src/constants/images/clockImage.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                        onPageChanged: (value) {
                          setState(() {
                            page = value;
                          });
                        },
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const SizedBox(
                              height: 24,
                              width: 24,
                              child: Icon(
                                Iconsax.arrow_circle_left,
                                size: 24,
                                color: black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              print('tap');
                            },
                            child: const SizedBox(
                              height: 24,
                              width: 24,
                              child: Icon(
                                Iconsax.shopping_cart,
                                size: 24,
                                color: black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 48,
                        width: 360,
                        margin: const EdgeInsets.only(top: 275),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                pageController.jumpToPage(index);
                              },
                              child: Container(
                                  height: 48,
                                  width: 48,
                                  margin: const EdgeInsets.only(right: 24),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          // spreadRadius: 5,
                                          blurRadius: 16,
                                          offset: const Offset(4,
                                              -4), // changes position of shadow
                                        ),
                                      ],
                                      border: Border.all(
                                          color: (page == index)
                                              ? black
                                              : gray.withOpacity(0.24))),
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                          "lib/src/constants/images/clockImage.png"),
                                    )),
                                  )),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '4.9',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'SFProText',
                              color: black,
                              height: 1.4),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        print('tap');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '1120 reviews',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'SFProText',
                                color: black,
                                height: 1.4),
                          ),
                          SizedBox(width: 8),
                          Center(
                            child: Icon(
                              Iconsax.arrow_right_3,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Apple Watch',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SFProText',
                          color: black,
                          height: 1.4),
                    ),
                    Spacer(),
                    Text(
                      '\$' + '199',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SFProText',
                          color: black,
                          height: 1.4),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Series 3 GPS',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SFProText',
                      color: gray,
                      height: 1.4),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 327,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare dictumst cras consectetur turpi habitant faucibus placerat quam. Commodo lectus odio arcu massa. Viverra augue fringilla vitae augue turpis. ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SFProText',
                        color: gray,
                        height: 1.4),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
