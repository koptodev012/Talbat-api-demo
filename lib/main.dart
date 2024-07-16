import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talbat_api_demo/features/order_details/cubit/order/order_cubit.dart';
import 'package:talbat_api_demo/features/order_details/presentation/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrderCubit(), // Bloc 1
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Talbat API Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const OrderScreen()),
    );
  }
}
