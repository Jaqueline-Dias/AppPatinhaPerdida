import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:patinha_app/src/core/constants/constants.dart';
import 'package:patinha_app/src/repositories/services/util_services.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final UtilsServices utilsServices = UtilsServices();
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;

  List<Widget> _carrossel(List<dynamic> fotos) {
    return fotos
        .map(
          (imagem) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.network(
              imagem,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
        )
        .toList();
  }

  Future<String> _getUserName(String userId) async {
    try {
      final userSnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(userId)
          .get();
      if (userSnapshot.exists) {
        return userSnapshot['nome'] ?? 'Usuário desconhecido';
      } else {
        return 'Usuário desconhecido';
      }
    } catch (e) {
      return 'Erro ao carregar usuário';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Feed de Relatos'),
      ),
      body: StreamBuilder(
        stream: db
            .collection("relatos")
            .orderBy("dataHora", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Erro ao recuperar os dados",
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Nenhum relato encontrado."),
            );
          }

          final List<DocumentSnapshot> documentos = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documentos.length,
            itemBuilder: (context, index) {
              final doc = documentos[index];
              final fotos = doc['fotos'] as List<dynamic>? ?? [];
              final userId = doc['usuario'] as String?;

              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cabeçalho do Post
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              doc['perfil'] ??
                                  'https://via.placeholder.com/150',
                            ),
                            radius: 16,
                          ),
                          const SizedBox(width: 8),
                          FutureBuilder<String>(
                            future: _getUserName(userId ?? ''),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text("Carregando...");
                              } else if (snapshot.hasError) {
                                return const Text("Erro ao carregar");
                              } else {
                                return Text(
                                  snapshot.data!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Publicado em: ${utilsServices.formatDate(doc['dataHora'])}",
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 8),

                      // Carrossel de Imagens
                      if (fotos.isNotEmpty)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _carrossel(fotos),
                          ),
                        ),
                      const SizedBox(height: 8),

                      // Descrição do Post
                      Text(
                        "Descrição do Animal:",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("Porte: ${doc['porte'] ?? 'Não informado'}"),
                      Text("Pelagem: ${doc['corPelagem'] ?? 'Não informado'}"),
                      Text(doc['coleira'] == true
                          ? "Possui coleira"
                          : "Sem coleira"),
                      Text(doc['machucado'] == true
                          ? "Machucado"
                          : "Não machucado"),
                      Text(doc['desnutrido'] == true
                          ? "Desnutrido"
                          : "Bem alimentado"),
                      Text(doc['docil'] == true ? "Dócil" : "Não dócil"),

                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: PPColors.primary,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          FutureBuilder<String>(
                            future:
                                utilsServices.getUserName(doc['localizacao']),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text("Obtendo endereço...");
                              } else if (snapshot.hasError) {
                                return const Text("Erro ao obter endereço");
                              } else {
                                return Text(
                                  snapshot.data!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),

                      const Divider(),

                      // Botão de Curtir
                      LikeButton(
                        size: 40,
                        likeCount: doc['like'] as int? ?? 0,
                        mainAxisAlignment: MainAxisAlignment.start,
                        countPostion: CountPostion.right,
                        animationDuration: const Duration(seconds: 1),
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: Colors.deepPurple,
                          dotSecondaryColor: Colors.purple,
                        ),
                        circleColor: const CircleColor(
                          start: Colors.purpleAccent,
                          end: Colors.pink,
                        ),
                        likeBuilder: (isLiked) {
                          return Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.red : Colors.grey,
                            size: 24,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
