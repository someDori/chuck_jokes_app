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
          Text(
            BlocProvider.of<RandomJokeCubit>(context).state,
            style: const TextStyle(
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final joke = await ApiService().randomJoke();
                  final categoryJoke = await ApiService().categoryJoke('dev');
                  setState(() {
                    BlocProvider.of<RandomJokeCubit>(context).newJoke(joke);
                  });
                  print('joke: $joke');
                },
                child: const Text('Joke'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
