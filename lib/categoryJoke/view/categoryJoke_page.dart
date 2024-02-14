import 'package:chuck_norris_jokes_app/api/services/joke_services.dart';
import 'package:chuck_norris_jokes_app/categoryJoke/cubit/categoryJoke_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryJokePage extends StatelessWidget {
  const CategoryJokePage({required this.category, super.key});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryJokeCubit(),
      child: CategoryJokeView(
        category: category,
      ),
    );
  }
}

class CategoryJokeView extends StatefulWidget {
  const CategoryJokeView({required this.category, super.key});
  final String category;

  @override
  State<CategoryJokeView> createState() => _CategoryJokeViewState();
}

class _CategoryJokeViewState extends State<CategoryJokeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} joke'),
      ),
      body: Column(
        children: [
          const Spacer(),
          BlocConsumer<CategoryJokeCubit, String>(
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('New joke created'),
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.fixed,
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                    },
                  ),
                ),
              );
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  state,
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () async {
                    final categoryJoke =
                        await ApiService().categoryJoke(widget.category);
                    BlocProvider.of<CategoryJokeCubit>(context)
                        .newJoke(categoryJoke);
                  },
                  child: const Text('Joke'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
