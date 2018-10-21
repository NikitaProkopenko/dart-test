import 'package:angular/core.dart';

@Injectable()
class AtmService {

  Map<int, int> atmResult(List<int>rating, int sum) {
    List<int> cashResultList = [];
    rating.sort();

    while (sum > 0) {
      for (int i = rating.length - 1; i >= 0; i--) {
        if (((sum % rating[i]) > 0) && ((sum % rating[i]) != sum) || (rating[i] == 1)) {
          cashResultList.add(rating[i]);
          sum = sum - rating[i];
        }
      }
    }

    cashResultList.sort();
    return this._catchArrayElementsDuplication(cashResultList);
  }

  Map<int, int> _catchArrayElementsDuplication(input) {
    List<MapEntry<int, int>> entries = [];
    int count = 1;

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

      if (count >= 1) {
        entries.add(new MapEntry(current, count));
        count = 1;
      }
    }

    return Map.fromEntries(entries);
  }
}
