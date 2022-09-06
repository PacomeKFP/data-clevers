part of server.models;

// TODO : Implements The Session class usinng a file as storage

// class Session {
//   final String? id;
//   final String userUid;
//   final String userId;
//   final List data;
//   final DateTime date = DateTime.now();

//   Session._(
//       {required this.userId,
//       this.id,
//       required this.userUid,
//       this.data = const []});

//   static Future<Session?> fromJson(Map<String, dynamic> json) async {
//     // return Session._(userId: json['userId'], userUid: userUid)
//   }

//   Future<bool?> isActiveSession({required String userUid}) async {
//     try {
//       return await Model.getCollection("sessions").then((sessions) => sessions
//           .find({'userUid': userId})
//           .toList()
//           .then((list) => list.isEmpty));
//     } catch (e) {
//       log("Error Occured when fetching sessions from database in session.model.dart\ ${e.toString()}");
//       return null;
//     }
//   }

//   static Future<Session?> create(
//       {required String userId,
//       String? id,
//       required String userUid,
//       List data = const []}) async {
//     try {
//       return await Model.getCollection("sessions").then((sessions) => sessions);
//     } catch (e) {
//       log("Error Occured when fetching sessions from database in session.model.dart\ ${e.toString()}");
//       return null;
//     }
//   }

//   static Future<Session?> open(
//       {required String userId,
//       String? id,
//       required String userUid,
//       List data = const []}) async {
//         try {
//           Session._(userId: userId, userUid: userUid);
//         } catch (e) {
          
//         }
//       }

//   Future<bool> close() async {
//     try {
//       await Model.getCollection("sessions").then((sessions) => sessions
//           .remove({'userUid': userUid}).then(
//               (doc) => log("Removed document: ${doc.toString()}")));
//       return true;
//     } catch (e) {
//       print("Error occured when ");
//       return false;
//     }
//   }
// }
