import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static connect() async {
    String mongoURL = dotenv.get('MONGO_URL');
    var db = await Db.create(mongoURL);
    await db.open();
  }
}
