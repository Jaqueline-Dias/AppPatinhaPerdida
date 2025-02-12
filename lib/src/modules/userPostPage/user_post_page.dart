import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/theme/patinha_perdida_theme.dart';
import 'package:patinha_app/src/repositories/services/util_services.dart';

class UserPostsPage extends StatefulWidget {
  final String userId;

  const UserPostsPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserPostsPage> createState() => _UserPostsPageState();
}

class _UserPostsPageState extends State<UserPostsPage> {
  final UtilsServices utilsServices = UtilsServices();

  Future<void> _deletePost(String postId) async {
    try {
      // Exclui o documento da coleção
      await FirebaseFirestore.instance
          .collection('relatos')
          .doc(postId)
          .delete();
    } catch (e) {
      debugPrint("Erro ao excluir relato: $e");
    }
  }

  void _confirmDelete(BuildContext context, String postId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmar Exclusão"),
          content: const Text("Tem certeza que deseja excluir este relato?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deletePost(postId); // Chama a função de exclusão
              },
              child: const Text(
                "Excluir",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus relatos'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('relatos')
            .where('usuario', isEqualTo: widget.userId)
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
                "Erro ao carregar os relatos",
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Nenhum relato encontrado."),
            );
          }

          final List<DocumentSnapshot> relatos = snapshot.data!.docs;

          return ListView.builder(
            itemCount: relatos.length,
            itemBuilder: (context, index) {
              final relato = relatos[index];
              final postId = relato.id; // Obtém o ID do documento

              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cabeçalho com o botão de excluir
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Relato ${index + 1}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: PatinhaPerdidaTheme.violetDark,
                              size: 24,
                            ),
                            onPressed: () {
                              _confirmDelete(context, postId);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Data do Relato
                      Text(
                        "Publicado em: ${utilsServices.formatDate(relato['dataHora'])}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),

                      // Fotos do Relato (se existirem)
                      if (relato['fotos'] != null &&
                          (relato['fotos'] as List).isNotEmpty)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: (relato['fotos'] as List<dynamic>)
                                .map(
                                  (foto) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Image.network(
                                      foto,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      const SizedBox(height: 8),

                      // Descrição do Relato
                      Text(
                        "Porte: ${relato['porte'] ?? 'Não informado'}",
                      ),
                      Text(
                        "Pelagem: ${relato['corPelagem'] ?? 'Não informado'}",
                      ),
                      Text(
                        relato['coleira'] == true
                            ? "Possui coleira"
                            : "Sem coleira",
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
