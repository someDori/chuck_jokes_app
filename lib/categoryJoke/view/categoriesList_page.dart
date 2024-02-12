import 'package:chuck_norris_jokes_app/api/services/joke_services.dart';
import 'package:chuck_norris_jokes_app/categoryJoke/cubit/categoryJoke_cubit.dart';
import 'package:chuck_norris_jokes_app/categoryJoke/view/categoryJoke_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    categoryLoader();
  }

  Future<void> categoryLoader() async {
    final response = await ApiService().categories();
    if (response.statusCode == 200) {
      setState(() {
        categories = (response.data as List<dynamic>)
            .map((dynamicValue) => dynamicValue.toString())
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: categories
            .map(
              (category) => InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(category),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryJokePage(category: category),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
