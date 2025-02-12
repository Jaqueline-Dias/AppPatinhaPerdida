import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/icon_button_patinha_perdida.dart';
import 'widgets/text_about.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonPatinhaPerdida(),
        title: const Text('Sobre o aplicativo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 8),
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/logo-horizontal.svg',
              ),
            ),

            //Dados
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextAbout(
                    paragraph:
                        "Com nosso aplicativo, você é capaz de registrar animais encontrados nas ruas de sua cidade. Através de fotos e demais informações, como cor, pelagem, porte, se aparenta estar ferido, se aparenta estar desnutrido, se aparenta ser dócil e se possui coleira."),
                TextAbout(
                    paragraph:
                        "Você também poderá registrar a localização em que o animal foi encontrado utilizando o GPS do seu dispositivo móvel. Ao clicar em RELATAR, você será direcionado para a página de mapa, onde poderá fixar a localização desejada."),
                TextAbout(
                    paragraph:
                        "Para realizar um novo relato de animal encontrado, será necessário fazer login na aplicação. Faça parte do nosso projeto e ajude na localização de animais."),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Vamos começar!"),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
