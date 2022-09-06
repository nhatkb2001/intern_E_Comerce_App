import 'package:e_comerce_intern_nhat/src/blocs/auth_blocs/auth_bloc.dart';
import 'package:e_comerce_intern_nhat/src/resources/authentication/auth_repository.dart';
import 'package:e_comerce_intern_nhat/src/ui/authentication/screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
          ),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const AtLoginScreen()),
        ));
  }
}
