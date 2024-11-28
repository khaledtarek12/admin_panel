import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/features/media/models/image_model.module.dart';
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
}
