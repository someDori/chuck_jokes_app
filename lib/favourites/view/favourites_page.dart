import 'package:chuck_norris_jokes_app/favourites/cubit/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavouritesCubit(),
      child: const FavouritesView(),
    );
  }
}

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavouritesCubit>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: BlocConsumer<FavouritesCubit, List<String>>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(
              child: Text(
                'No jokes added to favourites',
                style: TextStyle(
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return Column(
              children: state.asMap().entries.map((entry) {
                final index = entry.key;
                final joke = entry.value;
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Flexible(child: Text(joke)),
                          const SizedBox(
                            width: 16,
                          ),
                          IconButton(
                            onPressed: () {
                              print('delete pressed');
                              BlocProvider.of<FavouritesCubit>(context)
                                  .removeFromFavorites(index);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
