import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class atDashboardScreen extends StatefulWidget {
  const atDashboardScreen({Key? key}) : super(key: key);

  @override
  State<atDashboardScreen> createState() => _atDashboardScreenState();
}

class _atDashboardScreenState extends State<atDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            color: blueLight,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: const EdgeInsets.only(left: 28, right: 28, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const SizedBox(width: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 32),
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
                  const SizedBox(height: 24),
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => atProductScreen()));
                          // Get.to(() => atProductScreen());
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
                    height: 500,
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
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: white),
                              child: const TabBar(
                                indicator: BoxDecoration(
                                  color: violet,
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
                                    left: 8, right: 8, top: 0, bottom: 0),
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
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: TabBarView(
                                  children: [
                                    Container(
                                      color: blueLight,
                                      child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 8,
                                            crossAxisSpacing: 8,
                                          ),
                                          itemCount: 4,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8)),
                                                color: white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "lib/src/constants/images/clockImage.png"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const Text(
                                                    'Apple Watch',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'SFProText',
                                                        color: black,
                                                        height: 1.4),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                  const SizedBox(height: 8),
                                                  const Text(
                                                    '199K',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'SFProText',
                                                        color: black,
                                                        height: 1.4),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    Container(color: violet),
                                    Container(color: green),
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
    ));
  }
}
