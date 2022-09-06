import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:e_comerce_intern_nhat/src/ui/authentication/screens/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class atSignUpScreen extends StatefulWidget {
  const atSignUpScreen({Key? key}) : super(key: key);

  @override
  State<atSignUpScreen> createState() => _atSignUpScreenState();
}

class _atSignUpScreenState extends State<atSignUpScreen> {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool showPassword = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        height: 300 + 50,
        width: 380 + 24,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/src/constants/images/Background.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 165, top: 129 + 44),
        height: 140,
        width: 210,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/src/constants/images/frame.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 24, top: 76),
        height: 29,
        width: 81,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/src/constants/images/logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 24, top: 137),
        child: const Text('Sign up',
            style: TextStyle(
                color: white,
                fontSize: 40,
                fontFamily: 'SFProText',
                fontWeight: FontWeight.w800)),
      ),
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 320 + 24 + 44),
            Container(
                margin: const EdgeInsets.only(left: 24),
                child: Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Email address',
                            style: TextStyle(
                                color: black,
                                fontSize: 16,
                                fontFamily: 'SFProText',
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 48,
                        width: 327 + 24,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: gray,
                              blurRadius: 10,
                              offset: Offset(4, 4), // Shadow position
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            controller: emailController,
                            maxLines: 1,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Write your email',
                                hintStyle: TextStyle(fontSize: 16, color: gray),
                                suffixIcon: Icon(
                                  Icons.mail,
                                  size: 24,
                                  color: gray,
                                ),
                                fillColor: white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Password',
                            style: TextStyle(
                                color: black,
                                fontSize: 16,
                                fontFamily: 'SFProText',
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 48,
                        width: 327 + 24,
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: gray,
                              blurRadius: 10,
                              offset: Offset(4, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: showPassword,
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Write your password',
                                hintStyle:
                                    const TextStyle(fontSize: 16, color: gray),
                                suffixIcon: IconButton(
                                    icon: showPassword == true
                                        ? const Icon(
                                            Icons.visibility_off,
                                            size: 24,
                                            color: gray,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            size: 24,
                                            color: gray,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    }),
                                fillColor: white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Confirm password',
                            style: TextStyle(
                                color: black,
                                fontSize: 16,
                                fontFamily: 'SFProText',
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 48,
                        width: 327 + 24,
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: gray,
                              blurRadius: 10,
                              offset: Offset(4, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            obscureText: showPassword,
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm your password',
                                hintStyle:
                                    const TextStyle(fontSize: 16, color: gray),
                                suffixIcon: IconButton(
                                    icon: showPassword == true
                                        ? const Icon(
                                            Icons.visibility_off,
                                            size: 24,
                                            color: gray,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            size: 24,
                                            color: gray,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    }),
                                fillColor: white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: 327 + 24,
                        height: 44,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: black,
                        ),
                        child: ElevatedButton(
                          //action navigate to dashboard screen
                          onPressed: () async {
                            if (isLoading) return;
                            setState(() {});
                            await Future.delayed(Duration(seconds: 3));
                            if (this.mounted) {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: black,
                              onPrimary: Colors.white,
                              shadowColor: black.withOpacity(0.25),
                              elevation: 15,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              // maximumSize: Size.fromWidth(200),
                              minimumSize: const Size(327 + 24, 44),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              // BorderRadius.all(Radius.circular(16)),
                              textStyle: const TextStyle(
                                  color: white,
                                  fontFamily: 'SFProText',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                          child: isLoading
                              ? Container(
                                  height: 48,
                                  width: 200,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 24,
                                          height: 24,
                                          child:
                                              const CircularProgressIndicator(
                                                  color: white)),
                                      const SizedBox(width: 16),
                                      const Text(
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
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Do you have an account?',
                              style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: gray),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Let' + "'s" + ' Sign in ',
                                style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: black),
                              ),
                            ),
                          ]),
                      const SizedBox(height: 24),
                    ])))
          ])),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 24, top: 24),
          height: 24,
          width: 24,
          child: const Icon(
            Iconsax.arrow_circle_left,
            size: 24,
            color: white,
          ),
        ),
      ),
    ])));
  }
}
