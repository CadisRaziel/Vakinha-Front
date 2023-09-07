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

//*BaseState -> é criado para a nossa homepage receber o bloc e o state, se não eu não iria conseguir tipar com 'homeController'
//*HomeController> -> HomeController é o controller que eu quero que ele use
class _HomePageState extends BaseState<HomePage, HomeController> {
  //!Se nao tivesse o baseState eu faria assim:
  //!Porém como eu tenho o baseState eu nao preciso fazer isso \/
  // @override
  // void initState() {
  //   //preciso falar pra minha tela carregar os nossos produtos
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     context.read<HomeController>().loadProducts();
  //   });
  //   super.initState();
  // }

  @override
  //metodo criado no baseState e vai ser chamado somente quando a tela for construida
  void onReady() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),

      ///BlocConsumer -> ESCUTA(HomeController) E BUILDA(HomeState) a tela (lembre-se vai buildar a tela toda)
      body: BlocConsumer<HomeController, HomeState>(
        listener: ((context, state) {
          ///state.status.matchAny -> derivado do @match (se eu não tratei os outros estados ele cai aqui)
          ///o beneficio é que temos o controle de quando o nosso 'builder' vai rebuildar o nosso projeto, com o 'buildWhen'
          state.status.matchAny(

              ///any -> se veio error, se veio loader, se veio qualquer outra coisa eu vou querer que ele esconda o nosso loader
              any: () => hideLoader(),
              
              ///Quando for loading vai realizar o showLoader
              loading: () => showLoader(),
             
              ///Quando for error ele vai reliazar o error
              error: () {
                hideLoader();
                showError(state.errorMessage ?? "Erro não informado");
              });

          //!Eu poderia realizar um switch aqui(código comentado abaixo) tratando tudo, porém com o @match(o aquivo.g) ele me traz dois metodos que nós temos o controle da tela
          //!que são: "state.status.matchAny" e o "buildWhen", no nosso arquivo.g ele ja vai ter o switch abaixo
          //*Osb: poderiamos usar if else ou switch aqui caso não tivessemos o @match(sem utilizar build_runner e part e baseState) \/
          // if(state.status == HomeStateStatus.initial) {} else if...
          //ou
          //switch(state.status) {
          //  case HomeStateStatus.initial:
          //  case HomeStateStatus.loading:
          //  case HomeStateStatus.loaded:
          //}
        }),

        ///buildWhen -> quando é pra rebuildar a tela (Nós vamos controlar isso com os 3 metodos abaixo), derivado do @match
        buildWhen: ((previous, current) => current.status.matchAny(
              ///any -> sempre false, qualquer coisa que eu não estou mandando buildar ele vai ser falso, ele não vai buildar
              any: () => false,

              ///initial -> quero que faça o rebuild da tela
              initial: () => true,

              ///loaded -> quero que mostre a tela como esta, pois quando for loading eu quero que a tela fique como estava caso nada foi alterado
              loaded: () => true,
            )),

        ///builder ele funcionara mesmo se o 'buildWhen' e o 'listener' estiver vazio (porém não é recomendavel)
        builder: ((context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: ((context, index) {
                    ///products recuperando a lista de products toda 
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
