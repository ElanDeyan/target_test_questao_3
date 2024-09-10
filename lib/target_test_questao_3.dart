/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

typedef FaturamentoInsights = ({
  double menorFaturamento,
  double maiorfaturamento,
  int diasAcimaDaMedia,
});

/// Solucao para a questao 3 do desafio desenvolvedor da target
FaturamentoInsights getInsightsFaturamento(
    List<double> faturamentoDiarioAnual) {
  final diasComFaturamento = faturamentoDiarioAnual
      .where((faturamento) => faturamento > 0.0)
      .toList()
    ..sort();

  final media = diasComFaturamento.fold(0.0, (prev, elem) => prev + elem) /
      diasComFaturamento.length;

  return (
    menorFaturamento: diasComFaturamento.first,
    maiorfaturamento: diasComFaturamento.last,
    diasAcimaDaMedia:
        diasComFaturamento.where((faturamento) => faturamento > media).length,
  );
}
