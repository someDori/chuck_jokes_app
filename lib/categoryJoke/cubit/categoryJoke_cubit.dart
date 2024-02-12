import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryJokeCubit extends Cubit<String> {
  CategoryJokeCubit() : super('Press button to generate a joke');

  void newJoke(String joke) => emit(joke);
}
