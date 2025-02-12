import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/patinha_perdida_theme.dart';
import '../widgets/icon_button_patinha_perdida.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonPatinhaPerdida(),
        title: const Text('Ajuda'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/help.svg',
                height: 180,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Precisa de ajuda?",
              style: PatinhaPerdidaTheme.subTitleSmallStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Entre em contato com a desenvolvedora por meio do seguinte endereço de email:",
              style: PatinhaPerdidaTheme.titleSubDescription,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: PatinhaPerdidaTheme.violetDark,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Jaqueline",
                    style: TextStyle(
                      color: PatinhaPerdidaTheme.violetDark,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "jaqueline.ifpr.palmas@gmail.com",
                    style: PatinhaPerdidaTheme.titleSubDescription,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
