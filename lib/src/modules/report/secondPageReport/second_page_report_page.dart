import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/helpears/messages.dart';
import '../../../core/theme/patinha_perdida_theme.dart';
import '../widgets/container_register.dart';
import 'second_page_report_view_model.dart';
import 'widgets/container_selection_image.dart';

class SecondPageReportPage extends StatefulWidget {
  const SecondPageReportPage({super.key});

  @override
  State<SecondPageReportPage> createState() => _SecondPageReportPageState();
}

class _SecondPageReportPageState extends State<SecondPageReportPage>
    with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  //final viewModel = Injector.get<SecondPageReportViewModel>();
  final SecondPageReportViewModel viewModel = SecondPageReportViewModel();

  void initState() {
    messageListener(viewModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo relato'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              "2 de 2",
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
                //Características
                ContainerRegister(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Características',
                        style: PatinhaPerdidaTheme.titleDescriptionDropDown,
                      ),
                      const SizedBox(height: 16),

                      //Coleira
                      Text(
                        "O animal possui coleira?",
                        style: PatinhaPerdidaTheme.titleSubDescription,
                      ),
                      Watch(
                        (context) {
                          return FormBuilderRadioGroup(
                            name: "coleira",
                            options: ['Sim', 'Não']
                                .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: Text(lang),
                                    ))
                                .toList(growable: false),
                            validator:
                                Validatorless.required('Escolha uma opção'),
                            onChanged: (result) {
                              viewModel.fieldSelectedCollar.value =
                                  result.toString();
                            },
                          );
                        },
                      ),
                      Divider(),
                      const SizedBox(
                        height: 16,
                      ),

                      //Machucado
                      Text(
                        "O animal aparenta estar machucado?",
                        style: PatinhaPerdidaTheme.titleSubDescription,
                      ),
                      const SizedBox(height: 8),
                      Watch(
                        (context) {
                          return FormBuilderRadioGroup(
                            name: 'machucado',
                            options: ['Sim', 'Não']
                                .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: Text(lang),
                                    ))
                                .toList(growable: false),
                            validator:
                                Validatorless.required('Escolha uma opção'),
                            onChanged: (result) {
                              viewModel.fieldSelectedBruised.value =
                                  result.toString();
                            },
                          );
                        },
                      ),
                      Divider(),
                      const SizedBox(
                        height: 16,
                      ),

                      //Desnutrido
                      Text(
                        'O animal aparenta estar desnutrido?',
                        style: PatinhaPerdidaTheme.titleSubDescription,
                      ),
                      const SizedBox(height: 8),
                      Watch(
                        (context) {
                          return FormBuilderRadioGroup(
                            name: 'desnutrido',
                            options: ['Sim', 'Não']
                                .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: Text(lang),
                                    ))
                                .toList(growable: false),
                            validator:
                                Validatorless.required('Escolha uma opção'),
                            onChanged: (result) {
                              viewModel.fieldSelectedMalnourished.value =
                                  result.toString();
                            },
                          );
                        },
                      ),
                      Divider(),
                      const SizedBox(
                        height: 16,
                      ),

                      //Dócil
                      Text(
                        'O animal aparenta ser dócil?',
                        style: PatinhaPerdidaTheme.titleSubDescription,
                      ),
                      const SizedBox(height: 8),
                      Watch(
                        (context) {
                          return FormBuilderRadioGroup(
                            name: 'docil',
                            options: ['Sim', 'Não']
                                .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: Text(lang),
                                    ))
                                .toList(growable: false),
                            validator:
                                Validatorless.required('Escolha uma opção'),
                            onChanged: (result) {
                              viewModel.fieldSelectedMeek.value =
                                  result.toString();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),

                //Fotos
                ContainerRegister(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Fotos',
                        style: PatinhaPerdidaTheme.titleDescriptionDropDown,
                      ),
                      const SizedBox(height: 16),

                      //Seleção de imagens
                      Text(
                        'Registre algumas fotos desse animal',
                        style: PatinhaPerdidaTheme.titleSubDescription,
                      ),

                      const SizedBox(height: 16),

                      //Exibição das imagens
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _carrossel(),
                        ),
                      ),

                      //Botões para registrar imagem
                      Watch(
                        (context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ContainerSelectionImage(
                                icon: Icons.photo_library,
                                onPressed: () async {
                                  await viewModel.capturePhoto(camera: false);
                                  viewModel.adicionarFoto();
                                  setState(() {});
                                },
                                title: 'Galeria',
                              ),
                              ContainerSelectionImage(
                                icon: Icons.camera_alt,
                                onPressed: () async {
                                  await viewModel.capturePhoto();
                                  viewModel.adicionarFoto();
                                  setState(() {});
                                },
                                title: 'Tirar',
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                //Botão de publicar
                Watch(
                  (context) {
                    return SizedBox(
                      child: ElevatedButton(
                        onPressed: () async {
                          final valid =
                              formKey.currentState?.validate() ?? false;
                          //final nav = Navigator.of(context);

                          if (valid) {
                            final latitude = args['latitude'];
                            final longitude = args['longitude'];
                            final location = GeoPoint(latitude, longitude);

                            await viewModel.publishReport(
                              user: "U8bFPFBEi6Q5Ie3Eyl6gdj3ybwE3",
                              coatColor: args['coatColor'],
                              collar: viewModel.optionFieldSelectedCollar.value,
                              bruised:
                                  viewModel.optionFieldSelectedBruised.value,
                              malnourished: viewModel
                                  .optionFieldSelectedMalnourished.value,
                              selectedMeek:
                                  viewModel.optionFieldSelectedMeek.value,
                              size: args['size'],
                              photos: viewModel.photos,
                              location: location,
                              context: context,
                            );
                            print("Coleira");
                            print(viewModel.optionFieldSelectedCollar.value);
                            print("Machucado");
                            print(viewModel.optionFieldSelectedBruised.value);
                            print("Desnutrido");
                            print(viewModel
                                .optionFieldSelectedMalnourished.value);
                            print("Dócil");
                            print(viewModel.optionFieldSelectedMeek.value);
                            print(args['coatType']);
                            print(args['selectedSex']);
                            print(args['coatColor']);
                            print(args['size']);
                            print(args['latitude']);
                            print(args['longitude']);
                          }
                        },
                        child: const Text('Publicar relato'),
                      ),
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cancelar',
                      style: PatinhaPerdidaTheme.titleDescription,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Carrossel de imagens
  List<Widget> _carrossel() {
    List<Widget> imagens = List.empty(growable: true);
    List<File> imagensInvertidas = viewModel.photos.reversed.toList();
    for (File imagem in imagensInvertidas) {
      Padding temp = Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Image.file(
          imagem,
          fit: BoxFit.cover,
          height: 180,
        ),
      );
      imagens.add(temp);
    }
    return imagens;
  }
}
