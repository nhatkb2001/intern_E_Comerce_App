import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:e_comerce_intern_nhat/src/ui/product/screens/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GridviewProduct extends StatelessWidget {
  const GridviewProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blueLight,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: 8,
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  (index % 2 == 0)
                      ? GestureDetector(
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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "lib/src/constants/images/clockImage.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "lib/src/constants/images/imageHeadPhone.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                  const Text(
                    'Apple Watch',
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
                    padding:
                        const EdgeInsets.only(right: 8, left: 8, bottom: 4),
                    child: Row(
                      children: [
                        const Text(
                          '199K',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SFProText',
                              color: black,
                              height: 1.4),
                          textAlign: TextAlign.right,
                        ),
                        const Spacer(),
                        Container(
                          height: 24,
                          width: 24,
                          decoration: const BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: const Center(
                              child: Icon(Iconsax.shopping_cart,
                                  size: 16, color: white)),
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
}
