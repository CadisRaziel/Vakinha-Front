// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:front_delivery/app/pages/home/home_state.dart';
import 'package:front_delivery/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  //buscar os dados
  final ProductsRepository _productsRepository;

  //construtor com o estado inicial da tela
  HomeController(
    this._productsRepository,
  ) : super(HomeState.initial());

  Future<void> loadProducts() async {
    //o estado inicial é um loader, então preciso emitir (emit) um status de loading
    emit(state.copyWith(status: HomeStateStatus.loading));

    try {
      final products = await _productsRepository.findAllProducts();
      //!exception para testar o erro
      // throw Exception();
      //buscando meu dado (tela emit meus dados na tela)
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log("Erro ao buscar produtos", error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: "Erro ao buscar produtos"));
    }
  }
}
