import 'dart:core';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:timnew_reader/models/BookInfo.dart';
import 'package:timnew_reader/models/ChapterList.dart';
import 'package:timnew_reader/repositories/network/BookRepository.dart';
import 'package:timnew_reader/repositories/settings/BookIndexRepository.dart';

part 'BookIndex.g.dart';

abstract class BookIndex implements Built<BookIndex, BookIndexBuilder> {
  BookIndex._();

  String get bookId;

  String get bookName;

  Uri get chapterListUrl;

  Uri get bookInfoUrl;

  factory BookIndex({String bookId, String bookName, Uri bookInfoUrl, Uri chapterListUrl}) => _$BookIndex((b) => b
    ..bookId = bookId
    ..bookName = bookName
    ..bookInfoUrl = bookInfoUrl
    ..chapterListUrl = chapterListUrl);

  static Serializer<BookIndex> get serializer => _$bookIndexSerializer;

  static BookIndex load(String bookId) => BookIndexRepository.load(bookId);

  Future<void> save() => BookIndexRepository.save(this);

  Future<void > remove() => BookIndexRepository.remove(bookId);

  bool get hasCurrentChapter =>
      BookIndexRepository.hasCurrentChapterUrl(bookId);

  Uri get currentChapter => BookIndexRepository.loadCurrentChapter(bookId);

  set currentChapter(Uri url) =>
      BookIndexRepository.saveCurrentChapter(bookId, url);

  Future<void> setCurrentChapter(Uri url) =>
      BookIndexRepository.saveCurrentChapter(bookId, url);

  double get currentChapterProgress =>
      BookIndexRepository.loadCurrentChapterProgress(bookId);

  set currentChapterProgress(double progress) =>
      BookIndexRepository.saveCurrentChapterProgress(bookId, progress);

  Future<void> setCurrentChapterProgress(double progress) =>
      BookIndexRepository.saveCurrentChapterProgress(bookId, progress);

  static BuiltList<BookIndex> loadAll() => BookIndexRepository.loadAll();

  Future<BookInfo> fetchBookInfo() =>
      BookRepository.fetchBookInfo(bookInfoUrl);

  Future<ChapterList> fetchChapterList() =>
      BookRepository.fetchChapterList(chapterListUrl);
}
