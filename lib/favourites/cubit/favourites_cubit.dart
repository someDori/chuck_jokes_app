import 'package:chuck_norris_jokes_app/api/services/joke_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesCubit extends Cubit<List<String>> {
  FavouritesCubit() : super([]);

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList('favJokes') ?? [];
    emit(favs);
  }

  Future<void> removeFromFavorites(int index) async {
    final prefs = await SharedPreferences.getInstance();
    var favs = prefs.getStringList('favJokes') ?? [];
    favs = [
      ...favs.getRange(0, index),
      ...favs.getRange(index + 1, favs.length)
    ];
    print(favs);
    await prefs.setStringList('favJokes', favs);
    emit(favs);
  }

  void listFavorites() {}
}

/* 
Future<void> _removeFavorites(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList('favJokes');
    setState(() {
      favs?.removeAt(index);
    });
    print('favs: $favs');
  }
*/