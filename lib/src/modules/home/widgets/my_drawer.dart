import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/patinha_perdida_theme.dart';
import '../../widgets/dialog_app.dart';
import 'list_tile_drawer.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PatinhaPerdidaTheme.greyLigth,
      child: Column(
        children: [
          //Drawer header
          DrawerHeader(
            child: SvgPicture.asset("assets/images/logo-escuro.svg"),
          ),

          //Home
          ListTileDrawer(
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
            title: "Home",
            icon: Icons.home,
          ),

          //Perfil de usuário
          ListTileDrawer(
            onTap: () {
              Navigator.of(context).pushNamed('/user/profile');
            },
            title: "Perfil",
            icon: Icons.person,
          ),

          //Relatos do usuário
          ListTileDrawer(
            onTap: () {},
            title: "Meus relatos",
            icon: Icons.pets_sharp,
          ),

          //Sobre o app
          ListTileDrawer(
            onTap: () {
              Navigator.of(context).pushNamed('/about/app');
            },
            title: "Sobre",
            icon: Icons.info,
          ),

          //Ajuda
          ListTileDrawer(
            onTap: () {
              Navigator.of(context).pushNamed('/help/description');
            },
            title: "Ajuda",
            icon: Icons.help,
          ),

          //Desenvolvedores
          ListTileDrawer(
            onTap: () {
              Navigator.of(context).pushNamed('/info/developers');
            },
            title: "Desenvolvedores",
            icon: Icons.favorite,
          ),

          //logout
          ListTileDrawer(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogApp(
                    description:
                        "Tem certeza que deseja sair do aplicativo? Sua conta será desconectada.",
                    onPressed: () {
                      Navigator.of(context).pop();
                      //Navegar para login
                    },
                    title: "Confirmar saída",
                    titleButton: "Sair",
                  );
                },
              );
            },
            title: "Sair",
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
