import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
import 'package:front_delivery/app/models/product_model.dart';

part 'home_state.g.dart';

///LEMBRE-SE -> Ao utilizar o bloc voce precisa saber como vai estar o seu estado e qual é a ordem que seu estado esta !

//initial -> estado inicial do bloc
//loading -> momento que o bloc vai no backend buscar os dados
//loaded -> pego os dados e carregou a tela

@match ///match responsavel por fazer a geração (home_state.g baseado nesse enum !!) (lembre-se ao colocar essa anotação é preciso colocar os 'part of' e 'part')
enum HomeStateStatus {
  initial, //-> estado inicializado, o bloc sempre terá ele !
  loading, //-> Buscando os dados no backend (apresenta o CircularProgressIndicator)
  loaded, //-> Quando pego os dados do backend e carregou tudo (apresenta os dados do back na tela | List<ProductModel> products; | )
  error, //-> quando der erro no loaded
}

///Nossos ESTADOS

//*Para rodar o build_runner no terminal digite: flutter pub run build_runner watch -d

//!se eu colocar algo novo aqui com o build_runner rodando ele ja atualiza automatico, se não preciso roda o comando denovo

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;

  ///construtor default
  const HomeState({
    required this.status,
    required this.products,
    this.errorMessage,
  });

  ///segundo construtor para falar sobre o estado inicial (para inicializar com um status especifico)
  HomeState.initial()
      : status = HomeStateStatus.initial,
        products = [],
        errorMessage = null;

  ///props para fazer o '==' (equals)
  @override
  List<Object?> get props => [status, products, errorMessage];

  ///copyWith para que se eu nao passar o status ele usa o default, mais se eu passa ele usa o que eu passar (Parão prototype)
  ///resumindo se eu passa o status ele usa o que eu passei se não ele usa o que ja estava na propria classe
  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
