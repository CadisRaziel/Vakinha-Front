// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:front_delivery/app/pages/home/home_state.dart';
import 'package:front_delivery/app/repositories/products/products_repository.dart';

///Cubit<HomeState> -> HomeState é o estado que eu quero que ele use
class HomeController extends Cubit<HomeState> {

  ///injetando dependencia (buscando nossos dados do backend)
  final ProductsRepository _productsRepository;

  ///construtor com o estado inicial da tela
  HomeController(
    this._productsRepository,
  ) : super(HomeState.initial());

  Future<void> loadProducts() async {

    ///o estado inicial é um initial, então preciso emitir (emit) um status de loading (pois iniciaremos a busca no backend)
    emit(state.copyWith(status: HomeStateStatus.loading));

    try {
      //!Para testar o loader quando o carregamento é muito rapido
      // await Future.delayed(Duration(seconds: 2));

      final products = await _productsRepository.findAllProducts();

      //!exception para testar o erro
      // throw Exception();

      ///depos que concluir o loading eu emito na tela o loaded com a lista de products ou seja com os dados do backend
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {

      log("Erro ao buscar produtos", error: e, stackTrace: s);

      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: "Erro ao buscar produtos"));
    }
  }
}
