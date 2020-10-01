import 'package:timnew_reader/models/BookInfo.dart';
import 'package:timnew_reader/models/ChapterContent.dart';
import 'package:timnew_reader/models/ChapterList.dart';
import 'package:timnew_reader/models/NewBook.dart';
import 'package:timnew_reader/repositories/network/PiaotianAdapter.dart';
import 'package:timnew_reader/repositories/network/ReaderHttpClient.dart';
import 'package:timnew_reader/repositories/network/SiteAdapter.dart';

class BookRepository {
  static ReaderHttpClient client = ReaderHttpClient();

  static Map<String, SiteAdapter> adapters = {'www.ptwxz.com': PiaotianAdapter(client)};

  static Future<NewBook> createBook(Uri url) async => _findAdapter(url).createBook(url);

  static Future<NewBook> createBookByUrlString(String url) async => createBook(Uri.parse(url));

  static Future<ChapterContent> fetchChapterContent(Uri url, [String title]) async =>
      _findAdapter(url).fetchChapterContent(url);

  static Future<BookInfo> fetchBookInfo(Uri url) async => _findAdapter(url).fetchBookInfo(url);

  static Future<ChapterList> fetchChapterList(Uri url) async => _findAdapter(url).fetchChapterList(url);

  static Future<Object> fetchFromUrl(Uri url) async => _findAdapter(url).fetchFromUrl(url);

  static Future<Type> fetchResourceType(Uri url) async => _findAdapter(url).fetchResourceType(url);

  static SiteAdapter _findAdapter(Uri url) {
    final adapter = adapters[url.host];

    if (adapter == null) throw UnsupportedError('未知的網站');

    return adapter;
  }
}