import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:timnew_reader/models/BookIndex.dart';

part 'serializers.g.dart';

@SerializersFor(const [BookIndex])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();

