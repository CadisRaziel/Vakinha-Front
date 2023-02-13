// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:front_delivery/app/models/product_model.dart';

part 'home_state.g.dart';

//initial -> estado inicial do bloc
//loading -> momento que o bloc vai no backend buscar os dados
//loaded -> pego os dados e carregou a tela

@match
enum HomeStateStatus { initial, loading, loaded, error }

//!toda vez que eu coloco algo novo aqui, eu preciso atualizar o build_runner
//!se eu colocar algo novo aqui com o build_runner rodando ele ja atualiza automatico, se não preciso roda o comando denovo

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  const HomeState({
    required this.status,
    required this.products,
    this.errorMessage,
  });

  //segundo construtor para falar sobre o estado inicial (para inicializar com um status especifico)
  HomeState.initial()
      : status = HomeStateStatus.initial,
        products = [],
        errorMessage = null;

  //props para fazer o '=='
  @override
  List<Object?> get props => [status, products, errorMessage];

  //copyWith para que se eu nao passar o status ele usa o default, mais se eu passa ele usa o que eu passar
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
