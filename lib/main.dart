import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/core/services/dio.dart';
import 'package:bookia1/feature/auth/presentation/cubit/auth.cubit.dart';
import 'package:bookia1/feature/cart/presentation/cubit/cubit/cartcubit_cubit.dart';
import 'package:bookia1/intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dioprovider.init();
  await appdata.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: appcolors.gray,
            filled: true,
            hintStyle: appTextStyle(size: 15, color: appcolors.gray),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: appcolors.gray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: appcolors.gray),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
