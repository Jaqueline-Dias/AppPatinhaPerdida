import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/patinha_perdida_theme.dart';
import '../about/widgets/text_about.dart';
import '../widgets/icon_button_patinha_perdida.dart';
import 'widgets/developers.dart';

class DevelopersPage extends StatelessWidget {
  const DevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonPatinhaPerdida(),
        title: const Text('Desenvolvedores'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 16),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/developers.svg',
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              //Dados
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Sobre o desenvolvimento",
                    style: PatinhaPerdidaTheme.subTitleSmallStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextAbout(
                      paragraph:
                          "O aplicativo Patinha Perdida foi inicialmente elaborado durante a disciplina modular de Programação de Software e Aplicativos II em janeiro de 2024, pelos acadêmicos: Gustavo da Glória Favaretto Alves, Jaqueline Gabriele Dias e Vinicius Faber Zamarchi, sob orientação do professor Rafael Antonio Dangui, no 6º período do curso de Sistemas de Informação do IFPR - Campus Palmas. "),
                  TextAbout(
                      paragraph:
                          "Posteriormente,  ao longo do ano de 2024, a acadêmica Jaqueline deu continuidade ao projeto, realizando aprimoramentos no aplicativo durante as disciplinas de Estágio Supervisionado I e II."),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Envolvidos",
                    style: PatinhaPerdidaTheme.subTitleSmallStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Developers(name: "Gustavo", icon: Icons.star),
                      const SizedBox(
                        width: 16,
                      ),
                      Developers(name: "Jaqueline", icon: Icons.star),
                      const SizedBox(
                        width: 16,
                      ),
                      Developers(name: "Vinicius", icon: Icons.star),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
