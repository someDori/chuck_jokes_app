import 'package:flutter_test/flutter_test.dart';
import 'package:chuck_norris_jokes_app/app/app.dart';
import 'package:chuck_norris_jokes_app/randomJoke/randomJoke.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(RandomJokePage), findsOneWidget);
    });
  });
}
