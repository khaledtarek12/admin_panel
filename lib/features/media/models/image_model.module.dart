import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/utils/formatters/formatter.dart';

class ImageModel {
  String id;
  final String url;
  final String folder;
  final int? sizeByets;
  String mediaCategory;
  final String fileName;
  final String? fullePath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? contentType;
  final dynamic file;
  RxBool isSelected = false.obs;
  final Uint8List? localImageToDisplay;

  ImageModel({
    this.id = '',
    required this.url,
    required this.folder,
    required this.fileName,
    this.mediaCategory = '',
    this.sizeByets,
    this.fullePath,
    this.createdAt,
    this.updatedAt,
    this.contentType,
    this.file,
    this.localImageToDisplay,
  });

  static ImageModel empty() => ImageModel(url: '', folder: '', fileName: '');

  String get createdAtFormatted => TFormatter.formatDate(createdAt);
  String get updatedAtFormatted => TFormatter.formatDate(updatedAt);

  /// Convert a snapshot (Map) into an ImageModel
  factory ImageModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ImageModel(
        id: document.id,
        url: data['url'] ?? '',
        folder: data['folder'] ?? '',
        sizeByets: data['sizeBytes'] ?? 0,
        fileName: data['filename'] ?? '',
        fullePath: data['fullPath'] ?? '',
        mediaCategory: data['mediaCategory'] ?? '',
        createdAt:
            data.containsKey('createdAt') ? data['createdAt']?.toDate() : null,
        updatedAt:
            data.containsKey('updatedAt') ? data['updatedAt']?.toDate() : null,
        contentType: data['contentType'] ?? '',
      );
    } else {
      return empty();
    }
  }

  /// Convert an ImageModel into a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'folder': folder,
      'sizeBytes': sizeByets,
      'filename': fileName,
      'fullPath': fullePath,
      'mediaCategory': mediaCategory,
      'createdAt': createdAt?.toUtc(),
      'contentType': contentType,
    };
  }

  // Map Firebase Storage Data
  factory ImageModel.fromFriebaseMetadata(FullMetadata metadata, String folder,
      String filename, String downloadUrl) {
    return ImageModel(
      url: downloadUrl,
      folder: folder,
      fileName: filename,
      sizeByets: metadata.size,
      updatedAt: metadata.updated,
      fullePath: metadata.fullPath,
      createdAt: metadata.timeCreated,
      contentType: metadata.contentType,
    );
  }
}
