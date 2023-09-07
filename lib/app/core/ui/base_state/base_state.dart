import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_delivery/app/core/ui/helpers/loader.dart';
import 'package:front_delivery/app/core/ui/helpers/messages.dart';
import 'package:provider/provider.dart';

///O baseState pode ser usado por todas classes de UI que recebem o bloc e os mixins
//*abstract -> vai ter metodos implementados e vou ter que extender(extends) aonde eu vá usar, exemplo: class _HomePageState extends BaseState<HomePage, HomeController>
abstract class BaseState<T extends StatefulWidget, C extends BlocBase> //BlocBase -> pois os controllers estão extendendo(extends) o CUBIT
    extends State<T> with Loader, Messages {
  late final C controller;
  //?o "C" é um generic e vai ser substituido por homeController(ou qualquer outro controller que eu queira usar) exemplo: class _HomePageState extends BaseState<HomePage, HomeController> (repare no HomeController)
  
  //*Como nós iriamos colocar esse código no initState da ui direto, nós colocamos aqui e passamos pra uma função 'onReady' para ser usada la na UI para chamar o initState aqui
  @override
  void initState() {
    //pegando a instancia do provider(que esta na nossa home_router)
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
    super.initState();
  }

  void onReady();
}
