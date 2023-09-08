import 'package:bloc/bloc.dart';

///Eu poderia realizar essa regra de negocio com setState ou valueNotifier pois ela é muito simples
///porém iniciamos com o bloc e vamos finalizar com o bloc

///Essa tela não tera estado pois ela só precisa de um inteiro para decrementar e incrementar
class ProductDetailController extends Cubit<int> {
  ProductDetailController() : super(1); //-> estado inicial sempre 1

  void increment() => emit(state + 1);
  void decrement() {
    ///Lógica para ficar travado no 1, mesmo estando em 1 e diminuir ele não sai do 1
    if(state > 1) {
      emit(state - 1);
    }
  }
}
