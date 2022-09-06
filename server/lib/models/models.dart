library server.models;

import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

export 'user/user.model.dart';
export 'auth/auth.model.dart';
// part 'session.model.dart';

/// My base model for all my models
class Model {
  ///the funtion tha return the collection adapted to a Model,
  /// to use it you just have to pass the correct collection name adapted to the curretn  MODEL
  static Future<DbCollection> getCollection(String collectionName) async {
    Db db = await Db.create(
        'mongodb+srv://pacomekfp:pacomekfp@cluster0.dcp8x.mongodb.net/dataclevers');
    await db.open();
    return db.collection(collectionName);
  }
}
