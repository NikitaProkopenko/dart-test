@TestOn('browser')
import 'package:angular_test/angular_test.dart';
import 'package:dart_test/app_component.dart';
import 'package:dart_test/app_component.template.dart' as ng;
import 'package:pageloader/html.dart';
import 'package:test/test.dart';


void main() {
  final testBed =
      NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory);
  NgTestFixture<AppComponent> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  test('heading', () {
    expect(fixture.text, contains('ATM Test'));
  });
}
