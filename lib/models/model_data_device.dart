class Device {
  String guid = '';
  String statusSensor = '';
  String nameSensor = '';
  Device(
      this.guid,
      this.statusSensor,
      this.nameSensor,
      );

  Device.fromMap(Map<String, dynamic> device) {
    guid = device["guid"];
    statusSensor = device["statusSensor"];
    nameSensor = device["nameSensor"];

  }

  Map<String, dynamic> toMap() => {
    'guid' : guid,
    'statusSensor' : statusSensor,
    'nameSensor' : nameSensor,
  };

  String get getGuid => guid;
  String get getStatusSensor => statusSensor;
  String get getNameSensor => nameSensor;

  set getGuid(String value) {
    guid = value;
  }

  set getStatusSensor(String value) {
    statusSensor = value;
  }

  set getNameSensor(String value) {
    nameSensor = value;
  }
}