import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserModel {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String? photoUrl;
  final UserRole role;
  final DateTime createdAt;
  final String? storeName;
  final String? storeLogoUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.photoUrl,
    required this.role,
    required this.createdAt,
    this.storeName,
    this.storeLogoUrl,
  });

  factory UserModel.fromFirebaseUser(auth.User firebaseUser) {
    return UserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName ?? firebaseUser.email ?? 'No Name',
      phone: firebaseUser.phoneNumber,
      photoUrl: firebaseUser.photoURL,
      role: UserRole.customer,
      createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
      storeLogoUrl: null,
    );
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: (data['id'] as String?) ?? doc.id,
      email: (data['email'] as String?) ?? '',
      name: (data['name'] as String?) ?? 'No Name',
      phone: data['phone'] as String?,
      photoUrl: data['photoUrl'] as String?,
      role: UserRole.values.firstWhere(
        (e) => e.toString().split('.').last == (data['role'] as String?),
        orElse: () => UserRole.customer,
      ),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      storeName: data['storeName'] as String?,
      storeLogoUrl: data['storeLogoUrl'] as String?,
    );
  }

  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      phone: phone,
      photoUrl: photoUrl,
      role: role,
      createdAt: createdAt,
      storeName: storeName,
      storeLogoUrl: storeLogoUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'photoUrl': photoUrl,
      'role': role.toString().split('.').last,
      'createdAt': createdAt,
      'storeName': storeName,
      'storeLogoUrl': storeLogoUrl,
    };
  }
}
