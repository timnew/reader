import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart';
import 'package:gbk2utf8/gbk2utf8.dart';

import 'package:timnew_reader/features/App/common.dart';

class ReaderHttpClient {
  Future<Document> fetchDom(Uri url, {bool enforceGbk: true, String patchHtml(String html)}) async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw UserException("HTTP 錯誤 ${response.statusCode}\n$url");
    }

    final html = decodeBody(response, enforceGbk: enforceGbk);

    final patchedHtml = patchHtml != null ? patchHtml(html) : html;

    return htmlParser.parse(patchedHtml, encoding: 'utf8');
  }

  String decodeBody(http.Response response, {bool enforceGbk}) {
    if (enforceGbk) {
      return gbk.decode(response.bodyBytes);
    } else {
      return response.body;
    }
  }
}
