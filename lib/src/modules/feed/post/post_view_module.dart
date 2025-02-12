import 'package:flutter/material.dart';

import '../../../core/helpears/messages.dart';

class PostViewModule with MessageStateMixin {
  List<Widget> _carrossel(List<dynamic> fotos) {
    List<Widget> imagens = List.empty(growable: true);
    for (String imagem in fotos) {
      Padding temp = Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Image.network(
          imagem,
          fit: BoxFit.cover,
          height: 200,
        ),
      );
      imagens.add(temp);
    }
    return imagens;
  }

  //Retornar o nome do usuário que realizou o post
  /* Future<String> _getUserName(String userId) async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(userId)
        .get();

    if (userSnapshot.exists) {
      // O usuário foi encontrado, retorna o nome
      return userSnapshot['nome'];
    } else {
      // O usuário não foi encontrado, retorna uma mensagem padrão ou tratamento de erro
      return 'Usuário Desconhecido';
    }
  }*/
}
