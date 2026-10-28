import 'package:flutter_test/flutter_test.dart';
import 'package:focus_track_movil/main.dart';

void main() {
  testWidgets('incrementa y bloquea al llegar a 10 metas', (tester) async {
    await tester.pumpWidget(const FocusTrackApp());
    expect(find.text('0 / 5'), findsOneWidget);

    for (var i = 0; i < 10; i++) {
      await tester.tap(find.text('Completar Meta'));
      await tester.pump();
    }
    expect(find.text('10 / 5'), findsOneWidget);

    // Intento 11: no debe subir y debe mostrar el aviso.
    await tester.tap(find.text('Completar Meta'));
    await tester.pump();
    expect(find.text('10 / 5'), findsOneWidget);
    expect(find.textContaining('límite máximo diario'), findsOneWidget);
  });

  testWidgets('el selector de prioridad cambia el panel', (tester) async {
    await tester.pumpWidget(const FocusTrackApp());
    expect(find.text('Prioridad Media'), findsOneWidget);

    await tester.tap(find.text('Alta'));
    await tester.pump();
    expect(find.text('Prioridad Alta'), findsOneWidget);
  });
}
