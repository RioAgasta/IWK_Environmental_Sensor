class ValueModel {
  String serial;
  String valueSensor;
  String date;
  String time;
  String kelvin;
  String fahrenheit;
  String reamur;

  ValueModel(this.serial,this.valueSensor,this.date,this.time,this.kelvin,this.fahrenheit,this.reamur);

  String get getSerial => serial;
  String get getValueSensor => valueSensor;
  String get getDate => date;
  String get getTime => time;
  String get getKelvin => kelvin;
  String get getFahrenheit => fahrenheit;
  String get getReamur => reamur;

  set getSerial(String value) {
    serial = value;
  }
  set getValueSensor(String value) {
    valueSensor = value;
  }
  set getDate(String value) {
    date = value;
  }
  set getTime(String value) {
    time = value;
  }
  set getKelvin(String value) {
    kelvin = value;
  }
  set getFahrenheit(String value) {
    fahrenheit = value;
  }
  set getReamur(String value) {
    reamur = value;
  }
}