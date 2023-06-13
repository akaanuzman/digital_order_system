// ignore_for_file: must_be_immutable, overridden_fields

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../utility/base/base_firebase_model.dart';
part 'version_model.g.dart';

@JsonSerializable()
class VersionModel extends Equatable with BaseFirebaseModel<VersionModel> {
  String? versionNumber;

  VersionModel({
    this.versionNumber,
  });

  VersionModel copyWith({
    String? versionNumber,
  }) {
    return VersionModel(
      versionNumber: versionNumber ?? this.versionNumber,
    );
  }

  Map<String, dynamic> toJson() => _$VersionModelToJson(this);

  @override
  VersionModel fromJson(Map<String, dynamic> json) =>
      _$VersionModelFromJson(json);

  @override
  List<Object?> get props => [versionNumber];
}
