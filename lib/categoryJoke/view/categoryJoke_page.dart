import 'package:flutter/material.dart';

class CategoryJokePage extends StatelessWidget {
  const CategoryJokePage({required this.category, super.key});
  final String category;

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => CategoryJokeCubit(),
    //   child: const CategoryJokeView(),
    // );
    return Scaffold(
      appBar: AppBar(title: const Text('Category joke')),
      body: Text(category),
    );
  }
}

class CategoryJokeView extends StatefulWidget {
  const CategoryJokeView({super.key});

  @override
  State<CategoryJokeView> createState() => _CategoryJokeViewState();
}

class _CategoryJokeViewState extends State<CategoryJokeView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
