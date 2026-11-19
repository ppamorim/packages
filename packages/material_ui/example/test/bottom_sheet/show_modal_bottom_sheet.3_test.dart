// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:material_ui_examples/bottom_sheet/show_modal_bottom_sheet.3.dart'
    as example;

void main() {
  testWidgets('Dragging the list down from its top closes the sheet', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const example.BottomSheetApp());

    await tester.tap(
      find.widgetWithText(ElevatedButton, 'showModalBottomSheet'),
    );
    await tester.pumpAndSettle();
    expect(find.text('Item 0'), findsOneWidget);

    await tester.fling(find.byType(ListView), const Offset(0, 300), 2000);
    await tester.pumpAndSettle();
    expect(find.text('Item 0'), findsNothing);
  }, variant: TargetPlatformVariant.all());
}
