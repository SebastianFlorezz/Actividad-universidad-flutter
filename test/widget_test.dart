// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:actividad_celular/main.dart';

void main() {
  testWidgets('valida campos y navega al resumen calculado', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CompraApp());

    await tester.tap(find.text('Calcular compra'));
    await tester.pumpAndSettle();
    expect(find.text('Este campo es obligatorio'), findsOneWidget);
    expect(find.text('Ingresa el precio'), findsOneWidget);

    final campos = find.byType(TextFormField);
    await tester.enterText(campos.at(0), 'Reloj');
    await tester.enterText(campos.at(1), '100');
    await tester.enterText(campos.at(2), '2');
    await tester.enterText(campos.at(3), '10');
    await tester.ensureVisible(find.text('Calcular compra'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Calcular compra'));
    await tester.pumpAndSettle();

    expect(find.text('Reloj'), findsOneWidget);
    expect(find.text('\$200.00'), findsOneWidget);
    expect(find.text('- \$20.00'), findsOneWidget);
    expect(find.text('\$180.00'), findsOneWidget);

    await tester.tap(find.text('Volver al registro'));
    await tester.pumpAndSettle();
    expect(find.text('Calcula tu compra'), findsOneWidget);
  });
}
