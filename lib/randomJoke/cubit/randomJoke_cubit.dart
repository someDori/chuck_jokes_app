import 'package:bloc/bloc.dart';
import 'package:chuck_norris_jokes_app/api/services/joke_services.dart';

class RandomJokeCubit extends Cubit<String> {
  RandomJokeCubit() : super('');

  Future<void> newJoke() async {
    final joke = await ApiService().randomJoke();
    emit(joke);
  }
}
