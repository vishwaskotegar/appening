import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserDataModel {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<Data> data;
  final Support support;
  UserDataModel({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
    required this.support,
  });

  UserDataModel copyWith({
    int? page,
    int? per_page,
    int? total,
    int? total_pages,
    List<Data>? data,
    Support? support,
  }) {
    return UserDataModel(
      page: page ?? this.page,
      per_page: per_page ?? this.per_page,
      total: total ?? this.total,
      total_pages: total_pages ?? this.total_pages,
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'per_page': per_page,
      'total': total,
      'total_pages': total_pages,
      'data': data.map((x) => x.toMap()).toList(),
      'support': support.toMap(),
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      page: map['page'].toInt() as int,
      per_page: map['per_page'].toInt() as int,
      total: map['total'].toInt() as int,
      total_pages: map['total_pages'].toInt() as int,
      data: List<Data>.from(
        (map['data'] as List<dynamic>).map<Data>(
          (x) => Data.fromMap(x as Map<String, dynamic>),
        ),
      ),
      support: Support.fromMap(map['support'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDataModel(page: $page, per_page: $per_page, total: $total, total_pages: $total_pages, data: $data, support: $support)';
  }

  @override
  bool operator ==(covariant UserDataModel other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        other.per_page == per_page &&
        other.total == total &&
        other.total_pages == total_pages &&
        listEquals(other.data, data) &&
        other.support == support;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        per_page.hashCode ^
        total.hashCode ^
        total_pages.hashCode ^
        data.hashCode ^
        support.hashCode;
  }
}

class Data {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;
  Data({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  Data copyWith({
    int? id,
    String? email,
    String? first_name,
    String? last_name,
    String? avatar,
  }) {
    return Data(
      id: id ?? this.id,
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'avatar': avatar,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'].toInt() as int,
      email: map['email'] as String,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(id: $id, email: $email, first_name: $first_name, last_name: $last_name, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        avatar.hashCode;
  }
}

class Support {
  final String url;
  final String text;
  Support({
    required this.url,
    required this.text,
  });

  Support copyWith({
    String? url,
    String? text,
  }) {
    return Support(
      url: url ?? this.url,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'text': text,
    };
  }

  factory Support.fromMap(Map<String, dynamic> map) {
    return Support(
      url: map['url'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Support.fromJson(String source) =>
      Support.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Support(url: $url, text: $text)';

  @override
  bool operator ==(covariant Support other) {
    if (identical(this, other)) return true;

    return other.url == url && other.text == text;
  }

  @override
  int get hashCode => url.hashCode ^ text.hashCode;
}
