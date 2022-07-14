import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/view/widgets/cart_products.dart';
import 'package:medica/view/widgets/cart_total.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_text.dart';

import '../patient/patient_home.dart';
import '../patient/patient_profile.dart';
import '../view/widgets/custom_background.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        // Get.to(loginAs());
        Get.to(() => patient_home());
        return true;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            myDefaultBackground(),
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/png/register.png'),
                        fit: BoxFit.fill))),
            Container(
              // padding: EdgeInsets.symmetric(
              //   horizontal: size.width * 0.05,
              // ),
              // color: Colors.green,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/Menu.png'),
                      CustomText(
                        text: "USERNAME",
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                      Image.asset('assets/images/Notify.png')
                    ],
                  ),
                ],
              ),
            ),
            Stack(alignment: Alignment.bottomCenter, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      // right: size.width * 0.08,
                      // left: size.width * 0.08,
                      top: size.height * 0.04,
                    ),
                    // color: Colors.green,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75),
                        // topRight: Radius.circular(10),
                      ),
                      color: whitegrayish,
                    ),
                    height: size.height * 0.88,
                    width: double.infinity,
                    child: Column(
                      children: [
                        CartProducts(),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                // padding: EdgeInsets.only(
                //   top: size.height * 0.02,
                //   right: size.width * 0.1,
                //   left: size.width * 0.1,
                // ),
                width: double.infinity,
                height: size.height * 0.080,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(() => patient_home());
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/homeNavBarHome.svg',
                              color: primaryColorOutOfFocus,
                            ),
                            SizedBox(
                              height: size.height * 0.008,
                            ),
                            CustomText(
                              text: 'Home',
                              textStyle:
                                  TextStyle(color: primaryColorOutOfFocus),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/clipboardNavBarHome.svg'),
                            SizedBox(
                              height: size.height * 0.008,
                            ),
                            CustomText(
                              text: 'Consult',
                              textStyle: TextStyle(color: linkColor),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/message-circleNavBarHome.svg',
                                color: primaryColorOutOfFocus),
                            SizedBox(
                              height: size.height * 0.008,
                            ),
                            CustomText(
                              text: 'Chat',
                              textStyle:
                                  TextStyle(color: primaryColorOutOfFocus),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => patient_profile());
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/UserNavBarHome.svg',
                                color: primaryColorOutOfFocus),
                            SizedBox(
                              height: size.height * 0.008,
                            ),
                            CustomText(
                              text: 'Profile',
                              textStyle:
                                  TextStyle(color: primaryColorOutOfFocus),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
//     return Scaffold(
//       appBar: AppBar(title: Text("Your Cart")),
//       body: Column(
//         children: [
          // CartProducts(),
//           CartTotal(),
//         ],
//       ),
//     );
//   }
// }
