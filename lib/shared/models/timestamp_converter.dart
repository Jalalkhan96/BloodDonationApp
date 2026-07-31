import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp?, Object?> {
  const TimestampConverter();

  @override
  Timestamp? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json;
    if (json is Map) {
      final seconds = json['_seconds'] ?? json['seconds'];
      final nanoseconds = json['_nanoseconds'] ?? json['nanoseconds'];
      if (seconds is int && nanoseconds is int) {
        return Timestamp(seconds, nanoseconds);
      }
    }
    return null;
  }

  @override
  Object? toJson(Timestamp? object) => object;
}

class NonNullTimestampConverter implements JsonConverter<Timestamp, Object?> {
  const NonNullTimestampConverter();

  @override
  Timestamp fromJson(Object? json) {
    if (json is Timestamp) return json;
    if (json is Map) {
      final seconds = json['_seconds'] ?? json['seconds'];
      final nanoseconds = json['_nanoseconds'] ?? json['nanoseconds'];
      if (seconds is int && nanoseconds is int) {
        return Timestamp(seconds, nanoseconds);
      }
    }
    throw ArgumentError('Cannot convert $json to Timestamp');
  }

  @override
  Object? toJson(Timestamp object) => object;
}

class GeoPointConverter implements JsonConverter<GeoPoint?, Object?> {
  const GeoPointConverter();

  @override
  GeoPoint? fromJson(Object? json) {
    if (json == null) return null;
    if (json is GeoPoint) return json;
    if (json is Map) {
      final lat = json['latitude'] ?? json['_latitude'];
      final lng = json['longitude'] ?? json['_longitude'];
      if (lat is num && lng is num) {
        return GeoPoint(lat.toDouble(), lng.toDouble());
      }
    }
    return null;
  }

  @override
  Object? toJson(GeoPoint? object) => object;
}

class NonNullGeoPointConverter implements JsonConverter<GeoPoint, Object?> {
  const NonNullGeoPointConverter();

  @override
  GeoPoint fromJson(Object? json) {
    if (json is GeoPoint) return json;
    if (json is Map) {
      final lat = json['latitude'] ?? json['_latitude'];
      final lng = json['longitude'] ?? json['_longitude'];
      if (lat is num && lng is num) {
        return GeoPoint(lat.toDouble(), lng.toDouble());
      }
    }
    throw ArgumentError('Cannot convert $json to GeoPoint');
  }

  @override
  Object? toJson(GeoPoint object) => object;
}
