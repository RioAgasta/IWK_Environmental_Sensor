import 'dart:convert';

SensorData sensorDataFromJson(String str) =>
    SensorData.fromJson(json.decode(str));

String sensorDataToJson(SensorData data) => json.encode(data.toJson());

class SensorData {
  SensorData({
    required this.mac,
    required this.value,
    required this.status,
  });

  String mac;
  double value;
  String status;

  factory SensorData.fromJson(Map<String, dynamic> json) => SensorData(
    mac: json["mac"],
    value: json["value"].toDouble(),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "mac": mac,
    "value": value,
    "status": status,
  };
}