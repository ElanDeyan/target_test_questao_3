import 'dart:math';

import 'package:target_test_questao_3/target_test_questao_3.dart';
import 'package:test/test.dart';

void main() {
  test('Simple test', () {
    final faturamento = [
      for (var i = 0; i < 50; i++) Random().nextDouble() * 500
    ];

    final faturamentosPostivivosOrdenado = faturamento
        .where(
          (element) => element > 0.0,
        )
        .toList()
      ..sort();

    final menorFaturamento = faturamentosPostivivosOrdenado.first;
    final maiorFaturamento = faturamentosPostivivosOrdenado.last;
    final media =
        faturamentosPostivivosOrdenado.fold(0.0, (prev, elem) => prev + elem) /
            faturamentosPostivivosOrdenado.length;

    expect(
        getInsightsFaturamento(faturamento).menorFaturamento, menorFaturamento);
    expect(
        getInsightsFaturamento(faturamento).maiorfaturamento, maiorFaturamento);
    expect(
        faturamentosPostivivosOrdenado
            .where((faturamento) => faturamento > media),
        hasLength(getInsightsFaturamento(faturamento).diasAcimaDaMedia));
  });
}
