// ignore_for_file: must_be_immutable, overridden_fields

import 'package:equatable/equatable.dart';

import '../../utility/base/base_firebase_model.dart';

class VersionModel extends Equatable
    with BaseFirebaseModel<VersionModel> {
  String? versionNumber;

  VersionModel({
    this.versionNumber,
  });

  @override
  String? id = '';

  VersionModel copyWith({
    String? versionNumber,
  }) {
    return VersionModel(
      versionNumber: versionNumber ?? this.versionNumber,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'versionNumber': versionNumber,
    };
  }

  @override
  VersionModel fromJson(Map<String, dynamic> json) {
    return VersionModel(
      versionNumber: json['versionNumber'] as String?,
    );
  }

  @override
  List<Object?> get props => [versionNumber];
}
