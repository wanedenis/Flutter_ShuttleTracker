import 'dart:core';
import 'dart:ui';

import 'package:latlong/latlong.dart';

import 'shuttle_point.dart';
import 'shuttle_schedule.dart';

class ShuttleRoute {
  /// Bool to determine if route is active at current period of time
  bool active;

  /// Hex color of route
  Color color;

  /// Timestamp for when route was created
  String created;

  /// Description of this route
  String desc;

  /// Bool to determine if route is enabled for semester
  bool enabled;

  /// Id for this route
  int id;

  /// Name of this route
  String name;

  /// All points required to create the route with respective lat/lng values
  List<LatLng> points;

  /// List of shuttles currently associated with this route
  List<ShuttleSchedule> schedules;

  /// All stop ids associated with route
  List<int> stopIds;

  /// Timestamp for when route was last updated
  String updated;

  /// Width of route outline on map
  num width;

  ShuttleRoute({
    this.id,
    this.name,
    this.desc,
    this.enabled,
    this.color,
    this.width,
    this.stopIds,
    this.created,
    this.updated,
    this.points,
    this.active,
  });

  ShuttleRoute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    desc = json['description'].toString();
    enabled = json['enabled'];
    color = Color(int.parse(json['color'].toString().replaceAll('#', '0xff')));
    width = (json['width'] as num).toDouble();
    stopIds = List<int>.from(json['stop_ids'] as List);
    created = json['created'];
    updated = json['updated'];
    points = (json['points'] as List)
        .map((i) => ShuttlePoint.fromJson(i).getLatLng)
        .toList();
    active = json['active'];
    schedules = (json['schedule'] as List)
        .map((i) => ShuttleSchedule.fromJson(i))
        .toList();
  }
}
