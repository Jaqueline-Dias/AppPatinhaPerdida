import 'package:signals_flutter/signals_flutter.dart';

import '../../../core/helpears/messages.dart';

class FirstPageReportViewModel with MessageStateMixin {
  final fieldSelectedSex = signal<String>('');
  final dropValueCoatType = signal<String>('');
  final dropValueCoatColor = signal<String>('');
  final dropValueSize = signal<String>('');

  late final optionFieldSelectedSex = computed(
      () => fieldSelectedSex.value.compareTo("Fêmea") == 0 ? 'femea' : 'macho');

  final List<String> dropOptionsCoatType = [
    'Curto liso',
    'Curto ondulado',
    'Longo liso',
    'Longo ondulado'
  ];

  final List<String> dropOptionsCoatColor = [
    'Branco',
    'Caramelo',
    'Cinza',
    'Chocolate',
    'Creme',
    'Dourado',
    'Marrom',
    'Preto',
    'Vermelho',
  ];

  final List<String> dropOptionsSize = [
    'Pequeno',
    'Médio',
    'Grande',
  ];
}
