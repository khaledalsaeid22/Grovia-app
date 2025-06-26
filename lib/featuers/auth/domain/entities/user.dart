import 'package:equatable/equatable.dart';

enum UserRole { merchant, customer }

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final UserRole role;
  final String? photoUrl;
  final DateTime createdAt;
  final String? phone;
  final String? storeName;
  final String? storeLogoUrl;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.photoUrl,
    required this.createdAt,
    this.phone,
    this.storeName,
    this.storeLogoUrl,
  });
  User copyWith({
    String? id,
    String? email,
    String? name,
    UserRole? role,
    String? photoUrl,
    DateTime? createdAt,
    String? phone,
    String? storeName,
    String? storeLogoUrl,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      phone: phone ?? this.phone,
      storeName: storeName ?? this.storeName,
      storeLogoUrl: storeLogoUrl ?? this.storeLogoUrl,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    role,
    photoUrl,
    createdAt,
    phone,
    storeName,
    storeLogoUrl,
  ];

  @override
  String toString() => 'User(id: $id, email: $email, name: $name, role: $role)';
}
