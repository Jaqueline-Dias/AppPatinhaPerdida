import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patinha_app/src/model/post_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../core/helpears/messages.dart';

class SecondPageReportViewModel with MessageStateMixin {
  final fieldSelectedCollar = signal<String>('');
  final fieldSelectedBruised = signal<String>('');
  final fieldSelectedMalnourished = signal<String>('');
  final fieldSelectedMeek = signal<String>('');

  final List<File> photos = List.empty(growable: true);
  XFile? image;

  late final optionFieldSelectedCollar = computed(
    () => fieldSelectedCollar.value.compareTo('Sim') == 0
        ? 'com coleira'
        : 'sem coleira',
  );

  late final optionFieldSelectedBruised = computed(
    () => fieldSelectedBruised.value.compareTo('Sim') == 0
        ? 'está machucado'
        : 'não está machucado',
  );

  late final optionFieldSelectedMalnourished = computed(
    () => fieldSelectedMalnourished.value.compareTo('Sim') == 0
        ? 'está desnutrido'
        : 'não está desnutrido',
  );

  late final optionFieldSelectedMeek = computed(
    () =>
        fieldSelectedMeek.value.compareTo('Sim') == 0 ? 'dócil' : 'não é dócil',
  );

  adicionarFoto() {
    photos.add(File(image!.path));
  }

  capturePhoto({bool camera = true}) async {
    XFile? temp;

    final ImagePicker picker = ImagePicker();
    if (camera) {
      temp = await picker.pickImage(source: ImageSource.camera);
    } else {
      temp = await picker.pickImage(source: ImageSource.gallery);
    }

    if (temp != null) {
      image = temp;
    }
  }

  /// Função para publicar o relato
  Future<void> publishReport({
    required String user,
    required String coatColor,
    required String collar,
    required String bruised,
    required String malnourished,
    required String selectedMeek,
    required String size,
    required List<File> photos,
    required GeoPoint location,
    required BuildContext context,
  }) async {
    try {
      // 1. Carregar as fotos no Firebase Storage
      List<String> photoUrls = await _uploadPhotos(photos);

      // 2. Criar um novo PostModel com os dados
      PostModel post = PostModel(
        coleira: true,
        corPelagem: coatColor,
        porte: size,
        machucado: true,
        desnutrido: true,
        docil: true,
        usuario: user,
        fotos: photoUrls,
        localizacao: location,
        dataHora: DateTime.now().toString(),
        dislike: 0,
        like: 0,
        perfil:
            "https://firebasestorage.googleapis.com/v0/b/app-patinha-perdida-e5e1a.appspot.com/o/perfil%2F1706141721993?alt=media&token=b59f1e62-45c8-485b-8798-8aee01fb1c3c",
      );

      // 3. Publicar os dados no Firestore
      await _publishToFirestore(post);

      // Navegar para a tela Home (tela inicial)
      Navigator.of(context).pushNamed('/home');
    } catch (e) {
      print("Erro ao publicar relato: $e");
    }
  }

  /// Função para carregar as fotos no Firebase Storage e retornar as URLs
  Future<List<String>> _uploadPhotos(List<File> photos) async {
    List<String> photoUrls = [];

    for (File photo in photos) {
      try {
        String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
        UploadTask uploadTask =
            FirebaseStorage.instance.ref().child(fileName).putFile(photo);

        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        photoUrls.add(downloadUrl);
      } catch (e) {
        print("Erro ao carregar foto: $e");
      }
    }

    return photoUrls;
  }

  /// Função para publicar o PostModel no Firestore
  Future<void> _publishToFirestore(PostModel post) async {
    try {
      CollectionReference posts =
          FirebaseFirestore.instance.collection('relatos');
      await posts.add(post.toMap());
      print("Relato publicado com sucesso!");
    } catch (e) {
      print("Erro ao publicar no Firestore: $e");
    }
  }
}
