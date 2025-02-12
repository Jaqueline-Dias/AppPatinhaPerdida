import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Importação necessária para Firestore
import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/constants/constants.dart';

import '../widgets/icon_button_patinha_perdida.dart';
import 'widgets/button_password_reset.dart';
import 'widgets/container_profile.dart';
import 'widgets/pop_up_password_reset.dart';
import 'widgets/positioned_profile.dart';
import 'widgets/text_edit_controller_user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _emailEC = TextEditingController();
  final _displayNameEC = TextEditingController();
  // final _photoUrlEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final user = arguments['user'] as User;

    return Scaffold(
      appBar: AppBar(
        leading: IconButtonPatinhaPerdida(),
        title: Text(
          PPTexts.userProfile,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 15,
          top: 20,
          right: 15,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    //Imagem da foto e decoração do container
                    ContainerProfile(
                      user: user.photoURL,
                    ),

                    //Botão de editar perfil
                    PositionedProfile(
                      onTap: () => _showEditDialog(user),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              //Campos com os dados retornados do usuário
              TextEditControllerUser(
                labelText: PPTexts.fullName,
                placeholder: user.displayName ?? "",
                icon: Icons.person,
                controller: _displayNameEC..text = user.displayName ?? "",
              ),

              TextEditControllerUser(
                labelText: PPTexts.email,
                placeholder: user.email ?? "",
                icon: Icons.email,
                controller: _emailEC..text = user.email ?? "",
              ),

              ButtonPasswordReset(
                onPressed: () {
                  _updatePassword();
                },
                text: PPTexts.resetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para exibir o pop-up de edição
  void _showEditDialog(User user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          title: Text('Editar Perfil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _displayNameEC,
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                  hintText: 'Digite seu nome completo',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _emailEC,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite seu novo email',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                //   controller: _emailEC,
                decoration: InputDecoration(
                  labelText: 'Foto',
                  hintText: 'Selecionar imagem',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _updateUserProfile(user);
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  // Função para atualizar o perfil do usuário
  Future<void> _updateUserProfile(User user) async {
    try {
      // Atualizando o nome e a foto do usuário no Firebase Authentication
      await user.updateDisplayName(_displayNameEC.text);

      // Atualizando o email (se necessário)
      if (_emailEC.text != user.email) {
        await user.updateEmail(_emailEC.text);
      }

      // Atualizando os dados no Firestore
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'displayName': _displayNameEC.text,
      });

      // Exibindo sucesso para o usuário
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Perfil atualizado com sucesso')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar perfil: $e')));
    }
  }

  Future<void> _updatePassword() async {
    await showDialog(
      context: context,
      builder: (context) {
        return PopUpPasswordReset(
          emailEC: _emailEC, // Passando o controller para o pop-up
          onPressed: () async {
            final email = _emailEC.text;

            // Verifique se o e-mail foi fornecido
            if (email.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Por favor, insira seu e-mail.')),
              );
              return;
            }

            try {
              // Envia o e-mail de redefinição de senha
              await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

              // Exibe uma mensagem de sucesso
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text('E-mail de redefinição enviado com sucesso!')),
              );

              // Fechar o pop-up após o envio
              Navigator.of(context).pop();
            } catch (e) {
              // Exibe uma mensagem de erro caso algo aconteça
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Erro ao enviar o e-mail de redefinição.')),
              );
            }
          },
        );
      },
    );
  }
}
