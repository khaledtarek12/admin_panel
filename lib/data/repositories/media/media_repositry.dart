import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/features/media/models/image_model.module.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/helpers/firebase_storage.dart';

class MediaRepositry extends GetxController {
  static MediaRepositry get instance => Get.find();

  Future<ImageModel> uploadImageFileStorage(
      {required file, required String path, required String imagename}) async {
    try {
      final storage = await TStorage.getStorageInstance();

      final Reference ref = storage.ref('$path/$imagename');

      await ref.putBlob(file);

      final String downloadUrl = await ref.getDownloadURL();

      final FullMetadata metadata = await ref.getMetadata();

      return ImageModel.fromFriebaseMetadata(
          metadata, path, imagename, downloadUrl);
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> uploadImageFileInDatabase(ImageModel image) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('Images')
          .add(image.toJson());
      return data.id;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  // Fetch images from Firestore based on media category and toad count
  Future<List<ImageModel>> fetchImageFromDatabase(
      MediaCategory mediaCategory, int loadCount) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Images')
          .where('mediaCategory', isEqualTo: mediaCategory.name.toString())
          .orderBy('createdAt', descending: true)
          .limit(loadCount)
          .get();

      return querySnapshot.docs.map((e) => ImageModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      log(e.message.toString());
      throw e.message!;
    } on SocketException catch (e) {
      log(e.message.toString());
      throw e.message;
    } on PlatformException catch (e) {
      log(e.message.toString());
      throw e.message!;
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }

  // Fetch more images from Firestore based on media category and toad count
  Future<List<ImageModel>> loadMoreImageFromDatabase(
      MediaCategory mediaCategory,
      int loadCount,
      DateTime lastFetchedDate) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Images')
          .where('mediaCategory', isEqualTo: mediaCategory.name.toString())
          .orderBy('createdAt', descending: true)
          .startAfter([lastFetchedDate])
          .limit(loadCount)
          .get();

      if (querySnapshot.docs.isEmpty) {
        log('No more images found for $mediaCategory after $lastFetchedDate.');
      }

      return querySnapshot.docs.map((e) => ImageModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      log(e.message.toString());
      throw e.message!;
    } on SocketException catch (e) {
      log(e.message.toString());
      throw e.message;
    } on PlatformException catch (e) {
      log(e.message.toString());
      throw e.message!;
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
