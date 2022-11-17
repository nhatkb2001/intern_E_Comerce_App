import 'package:e_comerce_intern_nhat/src/blocs/auth_blocs/auth_bloc.dart';
import 'package:e_comerce_intern_nhat/src/blocs/auth_blocs/auth_events.dart';
import 'package:e_comerce_intern_nhat/src/blocs/auth_blocs/auth_state.dart';
import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:e_comerce_intern_nhat/src/resources/authentication/auth_repository.dart';
import 'package:e_comerce_intern_nhat/src/ui/authentication/screens/registerScreen.dart';
import 'package:e_comerce_intern_nhat/src/ui/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dashboard/navigation/navigationBar.dart';

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
  void authenticateWithEmailAndPassword(context) {
    BlocProvider.of<AuthBloc>(context).add(
      SignInRequested(emailController.text, passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Container(
          height: 300 + 12,
          width: 380 + 24 + 24,
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
          width: 90,
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
                          onPressed: () async {
                            authenticateWithEmailAndPassword(context);
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
                          child: BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                            if (state is Authenticated) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => navigationBar()));
                            }
                            if (state is AuthError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.error)));
                            }
                          }, builder: ((context, state) {
                            if (state is Loading) {
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
                                        color: white,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            if (state is Authenticated) {
                              return Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Success',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                  ),
                                ),
                              );
                            }
                            return Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600,
                                  color: white,
                                ),
                              ),
                            );
                          }))),
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
