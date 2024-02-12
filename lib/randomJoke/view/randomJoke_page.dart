import 'package:chuck_norris_jokes_app/api/services/joke_services.dart';
import 'package:chuck_norris_jokes_app/randomJoke/randomJoke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomJokePage extends StatelessWidget {
  const RandomJokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RandomJokeCubit(),
      child: const RandomJokeView(),
    );
  }
}

class RandomJokeView extends StatefulWidget {
  const RandomJokeView({super.key});

  @override
  State<RandomJokeView> createState() => _RandomJokeViewState();
}

class _RandomJokeViewState extends State<RandomJokeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('random joke'),
      ),
      body: Column(
        children: [
          const Spacer(),
          BlocConsumer<RandomJokeCubit, String>(
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
                padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final joke = await ApiService().randomJoke();
                    BlocProvider.of<RandomJokeCubit>(context).newJoke(joke);
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
