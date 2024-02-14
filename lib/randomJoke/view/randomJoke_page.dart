import 'package:chuck_norris_jokes_app/api/services/joke_services.dart';
import 'package:chuck_norris_jokes_app/favourites/cubit/favourites_cubit.dart';
import 'package:chuck_norris_jokes_app/randomJoke/randomJoke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomJokePage extends StatelessWidget {
  const RandomJokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RandomJokeCubit>(
          create: (BuildContext context) => RandomJokeCubit(),
        ),
        BlocProvider<FavouritesCubit>(
          create: (BuildContext context) => FavouritesCubit(),
        ),
      ],
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
  bool loveClicked = false;

  @override
  Widget build(BuildContext context) {
    final randomJokeCubit = BlocProvider.of<RandomJokeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('random joke'),
        actions: [
          if (randomJokeCubit.state != '')
            IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final favs = prefs.getStringList('favJokes');
                if (loveClicked) {
                  await prefs.remove('favJokes');
                } else {
                  await prefs.setStringList(
                    'favJokes',
                    [...?favs, randomJokeCubit.state],
                  );
                }
                loveClicked = !loveClicked;
                setState(() {});
              },
              icon: loveClicked
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
            ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          BlocConsumer<RandomJokeCubit, String>(
            listener: (context, state) {
              setState(() {
                loveClicked = false;
              });
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  state == '' ? 'Press button to generate a joke' : state,
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
                  onPressed: randomJokeCubit.newJoke,
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
