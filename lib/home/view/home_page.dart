import 'package:chuck_norris_jokes_app/categoryJoke/view/categoriesList_page.dart';
import 'package:chuck_norris_jokes_app/randomJoke/view/randomJoke_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RandomJokePage(),
                    ),
                  );
                },
                child: const Text('Random Joke'),
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CategoriesView(),
                    ),
                  );
                  print('Category pressed');
                },
                child: const Text('Category Joke'),
              ),
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
