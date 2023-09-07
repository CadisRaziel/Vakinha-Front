import 'package:intl/intl.dart';


///Formatação para simbolo do real
///ela vai pegar um valor '15.0' por exemplo e colocar como R$15,00
extension FormatterMixin on double {
  String get currencyPTBR {
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');
        ///r -> raw string (alteranativa da barra R\$)
    return currencyFormat.format(this);
  }
}
