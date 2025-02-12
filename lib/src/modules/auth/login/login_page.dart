import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:patinha_app/src/core/constants/constants.dart';
import 'package:patinha_app/src/modules/auth/login/login_view_model.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/helpears/messages.dart';
import '../../../core/theme/patinha_perdida_theme.dart';
import 'widgets/custom_text_field_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final controller = Injector.get<LoginViewModel>();
  bool loading = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String? userName = '';
  String? userEmail = '';
  String? userPhoto = '';

  void _sigIn() async {
    String email = _emailEC.text;
    String password = _passwordEC.text;

    User? user = await controller.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print('Login realizado com sucesso');
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      print('Erro ao realizar login');
    }
  }

  Future<void> _tryGoogleLogin() async {
    setState(() {
      loading = true;
    });

    final result = await _googleLogin();

    setState(() {
      loading = false;
    });

    if (result) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      _showError();
    }
  }

  /*Future<void> _tryGoogleLogin() async {
    _loading = true;
    final result = await _googleLogin();
    _loading = false;

    result ? _sigIn() : _showError();
  }*/

  /*Future<bool> _googleLogin() async {
    final result = await _googleSignIn.signIn().then((value) {
      userName = value!.displayName;
      userEmail = value.email;
      userPhoto = value.photoUrl;
    });

    return userName != '' ? true : false;
  }*/

  Future<bool> _googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // Login cancelado pelo usuário
        return false;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Faz login no Firebase com as credenciais do Google
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // Obtém informações do usuário
      final user = userCredential.user;
      if (user != null) {
        setState(() {
          userName = user.displayName;
          userEmail = user.email;
          userPhoto = user.photoURL;
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Erro ao fazer login com o Google: $e');
      return false;
    }
  }

  void _showError() {
    print('Erro ao fazer login.');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Erro ao fazer login com o Google. Tente novamente.'),
      ),
    );
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: PatinhaPerdidaTheme.violetDark,
      body: SingleChildScrollView(
        child: SizedBox(
          height: sizeOf.height,
          width: sizeOf.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/logo-claro.svg',
                          height: 200,
                        ),
                        const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

//Formulário
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: PPColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
//Email - campo com referência do widget custom_text_field na pasta config
                          CustomTextFieldConfig(
                            icon: Icons.email,
                            label: PPTexts.email,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Email obrigatório'),
                              Validatorless.email('Email inválido'),
                            ]),
                          ),

//Senha
                          CustomTextFieldConfig(
                            icon: Icons.lock,
                            label: 'Senha',
                            keyboardType: TextInputType.visiblePassword,
                            isSecret: true,
                            controller: _passwordEC,
                            validator:
                                Validatorless.required('Senha obrigatória'),
                          ),
//Botão esqueceu a senha
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Esqueceu sua senha?',
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          SizedBox(
                            width: sizeOf.width * .8,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {
                                final valid =
                                    _formKey.currentState?.validate() ?? false;

                                if (valid) {
                                  _sigIn();
                                }
                              },
                              child: const Text('ENTRAR'),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),

//Divisor
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.withAlpha(90),
                                    thickness: 2,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Text('Ou'),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.withAlpha(90),
                                    thickness: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),

//------------------------------BOTÃO PARA LOGIN COM REDES SOCIAIS-------------------------------------------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: TextButton(
                                    onPressed: () {},
                                    child: SvgPicture.asset(
                                      'assets/images/Facebook.svg',
                                      height: 32,
                                    )),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              SizedBox(
                                child: TextButton(
                                    onPressed: () {
                                      _tryGoogleLogin();
                                    },
                                    child: SvgPicture.asset(
                                      'assets/images/Google.svg',
                                      height: 32,
                                    )),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 18,
                          ),

                          GestureDetector(
                            onTap: () {
                              //Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Não tem uma conta? Criar.',
                              style: PatinhaPerdidaTheme.subTitleSmallStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

//Botão para voltar
            ],
          ),
        ),
      ),
    );
  }
}
