import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:expert_app/app.dart';

void main() {
  testWidgets(
    'ExpertApp shows the Supabase-not-configured screen when no credentials are provided',
    (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: ExpertApp()));
      await tester.pumpAndSettle();

      expect(find.text('Supabase konfiqurasiya olunmayıb'), findsOneWidget);
    },
  );
}
