import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_delivery/app/core/ui/base_state/base_state.dart';
import 'package:front_delivery/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:front_delivery/app/pages/home/home_controller.dart';
import 'package:front_delivery/app/pages/home/home_state.dart';
import 'package:front_delivery/app/pages/home/widgets/delivery_product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//!BaseState<HomePage, HomeController> -> criamos o base State para remover os mixins e o initiState daqui
class _HomePageState extends BaseState<HomePage, HomeController> {
  //!Agora esse initState vai para a baseState
  // @override
  // void initState() {
  //   //preciso falar pra minha tela carregar os nossos produtos
  //   //addPostFrameCallback -> para ter certeza que a tela ja esta construida
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     context.read<HomeController>().loadProducts();
  //   });
  //   super.initState();
  // }

  //metodo criado no baseState e vai ser chamado quando a tela for construida
  @override
  void onReady() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: ((context, state) {
          //porque usa o build_runner e o part ? pra nos dar um beneficio de controle e para usar o conceito de patern match
          state.status.matchAny(
              //any -> se eu nao tratei os outros estados ele cai aqui (se vier erro ou qualquer outra coisa que nao esteja aqui dentro, quero que ele esconda o loader)
              any: () => hideLoader(),
              loading: () => showLoader(),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? "Erro não informado");
              });

          //!Repare que o 'home_state.g.dart' fez tudo isso que pensavamos em fazer aqui nessa tela
          //!ele fez la e a gente colocou aqui de uma forma mais elegante e legivel
          //poderiamos usar if else ou switch aqui (sem utilizar build_runner e part)
          // if(state.status == HomeStateStatus.initial) {} else if...
          //ou
          //switch(state.status) {
          //  case HomeStateStatus.initial:
          //  case HomeStateStatus.loading:
          //  case HomeStateStatus.loaded:
          //}
        }),

        //buildWhen -> quando é pra rebuildar a tela
        buildWhen: ((previous, current) => current.status.matchAny(
              //any -> sempre false,
              any: () => false,
              //initial -> quero que faça o rebuild da tela
              initial: () => true,
              //loaded -> quero que mostre
              loaded: () => true,
            )),
        builder: ((context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: ((context, index) {
                    final products = state.products[index];
                    return DeliveryProductTile(
                      product: products,
                    );
                  }),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
