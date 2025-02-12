import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:patinha_app/src/modules/report/secondPageReport/second_page_report_page.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/helpears/messages.dart';
import '../../../core/theme/patinha_perdida_theme.dart';
import '../../widgets/icon_button_patinha_perdida.dart';
import '../widgets/container_register.dart';
import 'first_page_report_view_model.dart';
import 'widgets/drop_down_menu_options.dart';

class FirstPageReportPage extends StatefulWidget {
  FirstPageReportPage({
    super.key,
  });

  @override
  State<FirstPageReportPage> createState() => _FirstPageReportPageState();
}

class _FirstPageReportPageState extends State<FirstPageReportPage>
    with MessageViewMixin {
  final viewModel = Injector.get<FirstPageReportViewModel>();
  final formKey = GlobalKey<FormState>();

  void initState() {
    messageListener(viewModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Receber os argumentos passados pela navegação
    final _args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // Acessar as coordenadas de latitude e longitude
    final _latitude = _args['latitude'];
    final _longitude = _args['longitude'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButtonPatinhaPerdida(),
        title: const Text('Novo relato'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              "1 de 2",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PatinhaPerdidaTheme.violetDark,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Pelagem
                ContainerRegister(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Pelagem",
                        style: PatinhaPerdidaTheme.titleDescriptionDropDown,
                      ),
                      const SizedBox(height: 16),
                      //Tipo da pelagem
                      Text(
                        "Qual é o tipo de pelagem deste animal?",
                        style: PatinhaPerdidaTheme.titleSubDescription,
                      ),
                      const SizedBox(height: 8),

                      Watch(
                        (context) {
                          return SizedBox(
                            width: 280,
                            child: DropDownMenuOptions(
                              validator:
                                  Validatorless.required('Escolha uma opção'),
                              hint: "Escolha o tipo de pelagem",
                              value: (viewModel.dropValueCoatType.value.isEmpty)
                                  ? null
                                  : viewModel.dropValueCoatType.value,
                              onChanged: (option) => viewModel
                                  .dropValueCoatType.value = option.toString(),
                              dropdownItems: viewModel.dropOptionsCoatType
                                  .map(
                                    (dropOption) => DropdownMenuItem(
                                      value: dropOption,
                                      child: Text(dropOption),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),

                      Divider(),
                      const SizedBox(height: 12),

                      //Cor da pelagem
                      Text(
                        "Qual é a cor mais predominante?",
                        style: PatinhaPerdidaTheme.titleSubDescription,
                      ),
                      const SizedBox(height: 8),
                      Watch(
                        (context) {
                          return SizedBox(
                            width: 280,
                            child: DropDownMenuOptions(
                              validator:
                                  Validatorless.required('Escolha uma opção'),
                              hint: "Escolha a cor da pelagem",
                              value:
                                  (viewModel.dropValueCoatColor.value.isEmpty)
                                      ? null
                                      : viewModel.dropValueCoatColor.value,
                              onChanged: (option) => viewModel
                                  .dropValueCoatColor.value = option.toString(),
                              dropdownItems: viewModel.dropOptionsCoatColor
                                  .map(
                                    (dropOptionColor) => DropdownMenuItem(
                                      value: dropOptionColor,
                                      child: Text(dropOptionColor),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                //Porte do animal
                ContainerRegister(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Porte do animal",
                        style: PatinhaPerdidaTheme.titleDescriptionDropDown,
                      ),
                      const SizedBox(height: 16),
                      //Tipo da pelagem
                      Text(
                        "Qual é o porte deste animal?",
                        style: PatinhaPerdidaTheme.titleSubDescription,
                      ),
                      const SizedBox(height: 8),
                      Watch(
                        (context) {
                          return SizedBox(
                            width: 280,
                            child: DropDownMenuOptions(
                              validator:
                                  Validatorless.required('Escolha uma opção'),
                              hint: "Escolha o porte",
                              value: (viewModel.dropValueSize.value.isEmpty)
                                  ? null
                                  : viewModel.dropValueSize.value,
                              onChanged: (option) => viewModel
                                  .dropValueSize.value = option.toString(),
                              dropdownItems: viewModel.dropOptionsSize
                                  .map(
                                    (dropOptionSize) => DropdownMenuItem(
                                      value: dropOptionSize,
                                      child: Text(dropOptionSize),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                //Sexo do animal
                ContainerRegister(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sexo do animal",
                        style: PatinhaPerdidaTheme.titleDescriptionDropDown,
                      ),
                      const SizedBox(height: 8),
                      Watch(
                        (context) {
                          return FormBuilderRadioGroup(
                            name: "sexo",
                            options: ['Fêmea', 'Macho']
                                .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: Text(lang),
                                    ))
                                .toList(growable: false),
                            validator:
                                Validatorless.required('Escolha uma opção'),
                            onChanged: (result) {
                              viewModel.fieldSelectedSex.value =
                                  result.toString();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                //Botão de continuar
                Watch(
                  (context) {
                    return SizedBox(
                        child: ElevatedButton(
                      onPressed: () {
                        final valid = formKey.currentState?.validate() ?? false;

                        if (valid) {
                          // Navega diretamente para a segunda página passando os dados como argumentos.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPageReportPage(),
                              settings: RouteSettings(
                                arguments: {
                                  'coatType': viewModel.dropValueCoatType.value,
                                  'selectedSex':
                                      viewModel.optionFieldSelectedSex.value,
                                  'coatColor':
                                      viewModel.dropValueCoatColor.value,
                                  'size': viewModel.dropValueSize.value,
                                  'latitude': _latitude,
                                  'longitude': _longitude,
                                },
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Continuar'),
                    ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
