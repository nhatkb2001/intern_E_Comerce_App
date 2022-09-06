import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:e_comerce_intern_nhat/src/ui/authentication/screens/registerScreen.dart';
import 'package:e_comerce_intern_nhat/src/ui/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class AtLoginScreen extends StatefulWidget {
  const AtLoginScreen({Key? key}) : super(key: key);

  @override
  State<AtLoginScreen> createState() => _AtLoginScreen();
}

class _AtLoginScreen extends State<AtLoginScreen> {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
          height: 216,
          width: 210,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/src/constants/images/vectorSignIn.png"),
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
          child: const Text('Sign in',
              style: TextStyle(
                  color: white,
                  fontSize: 40,
                  fontFamily: 'SFProText',
                  fontWeight: FontWeight.w800)),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 8 + 4),
                      child: const Text('Forgot password?',
                          style: TextStyle(
                              color: black,
                              fontSize: 16,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 16),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const atDashboardScreen()));
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
                                        child: const CircularProgressIndicator(
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
                                  'Sign in',
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
                            'Don’t have an account?',
                            style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: gray),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const atSignUpScreen()));
                            },
                            child: const Text(
                              ' Sign up for free',
                              style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ]),
                  ],
                )),
              )
            ],
          ),
        )
      ]),
    ));
  }
}
