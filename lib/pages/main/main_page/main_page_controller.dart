import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

class MainPageController {
  late final HttpClient httpClient;

  final loaderState = ValueNotifier(LoaderState.loading);
  final currentIndex = ValueNotifier(0);

  MainPageController({required BuildContext context}) {
    Future.delayed(Duration.zero, () {
      httpClient = WProvider.of<HttpClient>(context);

      initializeAsync();
    });
  }

  Future<void> initializeAsync() async {
    // paginationIndexFiles = 1;
    // paginationIndexFolders = 1;

    // await httpClient.httpTransactionLoaderState(
    //   loaderState: loaderState,
    //   transaction: (transaction) async {
    //     await onDocumentsLoad();
    //     await onDocumentFoldersLoad();
    //   },
    // );

    // switch (currentFilter.value) {
    //   case "Last Opened":
    //     onFilterLastOpenedPressed();
    //     break;
    //   case "Name":
    //     onFilterNamePressed();
    //     break;
    //   case "Size":
    //     onFilterSizePressed();
    //     break;
    //   default:
    // }
  }

  // Future<void> onDocumentsLoad() async {
  //   final documents = await documentService.getDocumentAsync(
  //     paginationIndex: paginationIndexFiles,
  //   );

  //   if (documents.length < Configurations.itemPerPage) {
  //     paginationIndexFiles = 0;
  //   } else {
  //     paginationIndexFiles++;
  //   }

  //   this.documents.addAll(documents);
  // }

  // Future<void> onDocumentFoldersLoad() async {
  //   final documentFolders = await documentService.getDocumentAsync(
  //     paginationIndex: paginationIndexFolders,
  //     mimeType: "folder",
  //   );

  //   if (documentFolders.length < Configurations.itemPerPage) {
  //     paginationIndexFolders = 0;
  //   } else {
  //     paginationIndexFolders++;
  //   }

  //   this.documentFolders.addAll(documentFolders);
  // }

  // void onMorePressed(InDocumentDto document) {
  //   showModalBottomSheet(
  //     context: WRouter.navigatorKey.currentContext!,
  //     builder: (context) => DocumentMoreSheet(
  //       onDeletePressed: () {
  //         WRouter.pop();
  //         onDeletePressed(document);
  //       },
  //       onCopyPressed: () {
  //         WRouter.pop();
  //         WRouter.pushNamed(
  //           DocumentRoute.documentChooseLocationPath,
  //           arguments: DocumentChooseLocationPageArguments(
  //             document: document,
  //             mode: Mode.copy,
  //             documentMainPC: this,
  //           ),
  //         );
  //       },
  //       onDetailsPressed: () {},
  //       onDownloadPressed: () {},
  //       onMovePressed: () {
  //         WRouter.pop();
  //         WRouter.pushNamed(
  //           DocumentRoute.documentChooseLocationPath,
  //           arguments: DocumentChooseLocationPageArguments(
  //             document: document,
  //             mode: Mode.move,
  //             documentMainPC: this,
  //           ),
  //         );
  //       },
  //       onRenamePressed: () {},
  //       onSendPressed: () {},
  //       onSharePressed: () {},
  //     ),
  //   );
  // }

  // void onHideQuickAccessPressed() {
  //   isQuickAccessHide.value = !isQuickAccessHide.value;
  // }

  // void onHideRecentFilesPressed() {
  //   isRecentFilesHide.value = !isRecentFilesHide.value;
  // }

  // Future<void> onDocumentFolderPressed(InDocumentDto document) async {
  //   WRouter.pushNamed(
  //     DocumentRoute.documentDetailPath,
  //     arguments: DocumentDetailPageArguments(
  //       document: document,
  //       documentMainPC: this,
  //     ),
  //   ).then(
  //     (value) {
  //       if (currentFilter.value == "Last Opened") {
  //         onFilterLastOpenedPressed();
  //       }
  //     },
  //   );

  //   final listOpenedRaw = await storage.read(key: "last-opened");

  //   final listOpened =
  //       listOpenedRaw == null ? [] : json.decode(listOpenedRaw) as List;
  //   listOpened.removeWhere((element) => element == document.uuid);
  //   listOpened.add(document.uuid);

  //   await storage.write(
  //     key: "last-opened",
  //     value: json.encode(listOpened.toSet().toList()),
  //   );
  // }

  // void onAddPressed() {
  //   showModalBottomSheet(
  //     context: WRouter.navigatorKey.currentContext!,
  //     builder: (context) => DocumentAddSheet(
  //       onUploadFileTap: onUploadFilePressed,
  //       onCreateFolderTap: onCreateFolderPressed,
  //     ),
  //   );
  // }

  // void onSearchPressed() {
  //   WRouter.pushNamed(
  //     DocumentRoute.documentSearchPath,
  //     arguments: DocumentSearchPageArguments(documentMainPC: this),
  //   );
  // }

  // void onFilterPressed() {
  //   showModalBottomSheet(
  //     context: WRouter.navigatorKey.currentContext!,
  //     builder: (context) => DocumentMainFilterSheet(documentMainPC: this),
  //   );
  // }

  // Future<void> onFilterLastOpenedPressed() async {
  //   currentFilter.value = "Last Opened";
  //   final lastOpenedRaw = await storage.read(key: "last-opened");

  //   if (lastOpenedRaw == null) {
  //     return;
  //   }

  //   final sorted = documents.value;

  //   documents.clear();

  //   final lastOpened = json.decode(lastOpenedRaw) as List;

  //   for (var i = 0; i < lastOpened.length; i++) {
  //     final index =
  //         sorted.indexWhere((element) => lastOpened[i] == element.uuid);
  //     if (index >= 0) {
  //       final deleted = sorted.removeAt(
  //           sorted.indexWhere((element) => lastOpened[i] == element.uuid));
  //       sorted.insert(0, deleted);
  //     }
  //   }

  //   documents.addAll(sorted);
  // }

  // void onFilterNamePressed() {
  //   final sorted = documents.value;
  //   currentFilter.value = "Name";
  //   documents.clear();

  //   sorted.sort(
  //     (a, b) => a.name!.compareTo(b.name!),
  //   );

  //   documents.addAll(sorted);
  // }

  // void onFilterSizePressed() {
  //   currentFilter.value = "Size";
  //   final sorted = documents.value;
  //   documents.clear();

  //   sorted.sort(
  //     (a, b) => b.size!.compareTo(a.size!),
  //   );

  //   documents.addAll(sorted);
  // }

  // Future<void> onUploadFilePressed() async {
  //   WRouter.pop();

  //   final pickFile = await FilePicker.platform.pickFiles(type: FileType.image);
  //   final selectedFilePath = pickFile?.paths.first;

  //   if (selectedFilePath == null) {
  //     return;
  //   }

  //   bool result = false;

  //   await httpClient.httpTransaction(
  //     transaction: (transaction) async {
  //       result =
  //           await documentService.uploadDocumentAsync(path: selectedFilePath);
  //     },
  //   );

  //   if (result) {
  //     initializeAsync();
  //   }
  // }

  // Future<void> onDeletePressed(InDocumentDto document) async {
  //   final uuid = document.uuid;

  //   if (uuid == null) {
  //     return;
  //   }

  //   bool result = false;
  //   await httpClient.httpTransaction(
  //     transaction: (transaction) async {
  //       result = await documentService.deleteDocumentAsync(uuid: uuid);
  //     },
  //   );

  //   if (result) {
  //     initializeAsync();
  //   }
  // }

  // Future<void> onCreateFolderPressed() async {
  //   WRouter.pop();

  //   final nameFolder = await showModalBottomSheet(
  //     context: WRouter.navigatorKey.currentContext!,
  //     builder: (context) => DocumentCreateFolderSheet(
  //       onCreatePressed: (value) {
  //         WRouter.pop(result: value);
  //       },
  //     ),
  //   );

  //   if (nameFolder == null) {
  //     return;
  //   }

  //   final outDocumentCreateFolderDto = OutDocumentCreateFolderDto(
  //     name: nameFolder,
  //   );

  //   bool result = false;
  //   await httpClient.httpTransaction(
  //     transaction: (transaction) async {
  //       result = await documentService.createFolderAsync(
  //         outDocumentCreateFolderDto: outDocumentCreateFolderDto,
  //       );
  //     },
  //   );

  //   if (result) {
  //     initializeAsync();
  //   }
  // }
}
