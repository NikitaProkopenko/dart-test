import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'atm_service.dart';

@Component(
  selector: 'atm',
  styleUrls: ['atm_component.css'],
  templateUrl: 'atm_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [const ClassProvider(AtmService)],
)
class AtmComponent {
  // final AtmService atmService;

  List<String> items = [];
  String newSum = '';

  // AtmComponent(this.atmService);

  // Switched JS

  List<int> rating = [1, 5, 10, 20];
  List<int> cashArray = [];

  void atmResult(rating) {
    int sum = int.tryParse(this.newSum);
    print(sum);
    rating.sort();

    while (sum > 0) {
      for (int i = rating.length - 1; i >= 0; i--) {
        var reminder = sum % rating[i];
        // print('Остаток от деления $sum на ' + rating[i] + ' равен $reminder');

        // Проход, чтобы собрать все номиналы, включая 1
        if (((sum % rating[i]) > 0) && ((sum % rating[i]) != sum) || (rating[i] == 1)) {
          cashArray.add(rating[i]);

          print(cashArray);

          // Уменьшаю сумму относительно выданных банкнот
          sum = sum - rating[i];
        }
      }
    }

    cashArray.sort();
    print(cashArray); // Собран массив из всех выданных банкнот
  }

  void add() {
    items.add(newSum);
  }

  void test() {
    atmResult(rating);
    add();
    catchArrayElementsDuplication(cashArray);
  }

  String catchArrayElementsDuplication(input) {
    String result = '';
    int count = 1;
    int totalCount = 0;

    for (int i = 0; i < input.length; i++) {
      int current = input[i];
      int next;

      if (i + 1 == input.length) {
        next = null;
      } else {
        next = input[i + 1];
      }

      if (current == next) {
        count++;
        continue;
      }

      result += current.toString();

      if (count >= 1) {
        result += ' - ' + (count.toString() + 'шт;');
        totalCount += count;
        count = 1;
      }
    }

    print(result);
    print(totalCount);
    return result;
  }

  // Switched JS end

  String remove(int index) => items.removeAt(index);
}
