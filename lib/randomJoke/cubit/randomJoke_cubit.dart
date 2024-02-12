import 'package:bloc/bloc.dart';
import 'package:chuck_norris_jokes_app/api/models/joke_model.dart';

class RandomJokeCubit extends Cubit<String> {
  RandomJokeCubit() : super('Press button to generate a joke');

  void newJoke(String joke) => emit(joke);
}
