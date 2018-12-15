import 'package:html/dom.dart';
import 'package:reader/models/BookInfo.dart';
import 'package:reader/models/ChapterContent.dart';
import 'package:reader/models/ChapterList.dart';
import 'package:reader/models/ChapterRef.dart';
import 'package:reader/repositories/network/ReaderHttpClient.dart';
import 'package:reader/repositories/network/SiteAdapter.dart';
import 'package:reader/repositories/network/safeExtractors.dart';

class PiaotianAdapter extends SiteAdapter {
  PiaotianAdapter(ReaderHttpClient client) :super(client);

  static final bookUrlPattern = RegExp(
      r"https?://www.piaotian.com/bookinfo/(\d+)/(\d+).html",
      caseSensitive: false);

  static final chapterListUrlPattern = RegExp(
      r"https?://www.piaotian.com/html/(\d+)/(\d+)/(index.html)?",
      caseSensitive: false);

  static final chapterContentUrlPattern = RegExp(
      r"https?://www.piaotian.com/html/(\d+)/(\d+)/(\d+).html",
      caseSensitive: false);

  @override
  Future<Type> fetchResourceType(Uri url) async {
    var urlString = url.toString();

    if (chapterContentUrlPattern.hasMatch(urlString)) {
      return ChapterContent;
    }

    if (chapterListUrlPattern.hasMatch(urlString)) {
      return ChapterList;
    }

    if (bookUrlPattern.hasMatch(urlString)) {
      return BookInfo;
    }

    throw "Unknown Url: $url";
  }

  @override
  Future<BookInfo> fetchBookInfo(Uri url) async {
    final document = await client.fetchDom(url, enforceGbk: true);

    return BookInfo((b) =>
    b
      ..url = url
      ..chapterListUrl = Uri.parse(
          url
              .toString()
              .replaceFirst("/bookinfo/", "/html/")
              .replaceFirst(".html", "/")
      )
      ..title = document
          .querySelector('h1')
          .text
          .trim()
      ..author = safeText(() =>
            _extractMeta(document, 3, '作    者：')
      )
      ..genre = safeText(() =>
          _extractMeta(document, 2, '类    别：')
      )
      ..completeness = safeText(() =>
          _extractMeta(document, 7, '文章状态：')
      )
      ..lastUpdated = safeText(() =>
          _extractMeta(document, 6, '最后更新：')
      )
      ..length = safeText(() =>
          _extractMeta(document, 5, '全文长度：')
      )
    );
  }

  String _extractMeta(Document document, int index, String toRemove) =>
      document
          .querySelectorAll(
          '#content > table > tbody > tr > td > table[cellpadding="3"]')
          .first
          .querySelectorAll('tr > td')[index]
          .text
          .trim()
          .replaceAll(toRemove, '');


  @override
  Future<ChapterList> fetchChapterList(Uri url) async {
    final document = await client.fetchDom(url, enforceGbk: true);

    return ChapterList((b) =>
    b
      ..url = url
      ..title = safeText(() =>
            document
            .querySelector('.title h1')
                ?.text
                ?.trim()
                ?.replaceAll("最新章节", ""))
      ..bookUrl = safeUrl(url, () =>
        document.querySelectorAll('#tl > a')[1].attributes['href']
      )
      ..chapters.addAll(safeList(() =>
          document
              .querySelectorAll('.mainbody .centent ul li a')
              .map((element) =>
              ChapterRef(
                      (crb) =>
                  crb
                    ..url = url.resolve(element.attributes['href'])
                    ..title = element.text
              )
          )
      ))
    );
  }

  @override
  Future<ChapterContent> fetchChapterContent(Uri url) async {
    final document = await client.fetchDom(
        url, enforceGbk: true, patchHtml: (html) =>
        html.replaceFirst(
            '<script language="javascript">GetFont();</script>',
            '<div id="content">'));

    return ChapterContent((b) =>
    b
      ..url = url
      ..title = safeText(() =>
        document
            .querySelector('h1')
            .text)
      ..menuUrl = safeUrl(url, () =>
        document
            .querySelectorAll('.toplink > a')[1]
            .attributes['href'])
      ..previousChapterUrl = safeUrl(url, () =>
        document
            .querySelectorAll('.toplink > a')[0]
            .attributes['href'])
      ..nextChapterUrl = safeUrl(url, () =>
        document
            .querySelectorAll('.toplink > a')[2]
            .attributes['href'])
      ..paragraphs.addAll(safeList(() =>
            document
            .getElementById('content')
            .nodes
            .where((node) => node.nodeType == Node.TEXT_NODE)
            .map((node) => node.text.trim())
            .where((text) => text.isNotEmpty)
      ))
    );
  }
}