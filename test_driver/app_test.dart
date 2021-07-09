import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });
    test('Calling api and show value', () async {
      expect(await driver.getText(find.byValueKey('value_total')), 'R\$ 3.200.876,00');
    });
  });
}
