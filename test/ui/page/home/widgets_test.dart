import 'package:challenge_app/model/balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_app/ui/page/home/widgets/widgets.dart';

void main() {
  group('Units tests widgets of home page', () {
    final balanceMock = BalanceModel(
      cdi: 2.768,
      total: 2123.12,
      gain: 18021.0,
      hasHistory: true,
      id: 1,
      profitability: 2.768,
    );
    group('Units test card widget', () {
      testWidgets('Card Loading', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: CardHomePage(balance: BalanceModel.empyt(), isLoading: true),
        ));

        expect(find.text('Seu Resumo'), findsNothing);
      });
      testWidgets('Card show balance', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: CardHomePage(balance: balanceMock),
        ));

        expect(find.text('R\$ 2.123,12'), findsOneWidget);
      });
    });
  });
}
