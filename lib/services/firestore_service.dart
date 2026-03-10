import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  final collection =
      FirebaseFirestore.instance.collection("listings");

  Stream<QuerySnapshot> getListings(){
    return collection.snapshots();
  }

  Future addListing(Map<String,dynamic> data){
    return collection.add(data);
  }

  Future updateListing(String id,Map<String,dynamic> data){
    return collection.doc(id).update(data);
  }

  Future deleteListing(String id){
    return collection.doc(id).delete();
  }

}