import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'atm_service.dart';

@Component(
  selector: 'atm',
  styleUrls: ['atm_component.css'],
  templateUrl: 'atm_component.html',
  directives: [
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
  ],
  providers: [const ClassProvider(AtmService)],
)
class AtmComponent {
  final AtmService atmService;

  String newSum = '';
  List<MapEntry<int, int>> bills = [];

  AtmComponent(this.atmService);

  List<int> rating = [1, 5, 10, 20];
  List<int> cashArray = [];

  void billsCounter() {
    int sum = int.tryParse(this.newSum);
    if (sum != null) {
      this.bills = List.from(this.atmService.atmResult(rating, sum).entries);
    }
  }
}
