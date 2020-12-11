// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverAdapter extends TypeAdapter<Driver> {
  @override
  final typeId = 1;

  @override
  Driver read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Driver(
      driverID: fields[0] as String,
      userId: (fields[1] as List)?.cast<dynamic>(),
      name: fields[2] as String,
      phoneNo: fields[3] as String,
      vehicleNo: fields[4] as String,
      username: fields[5] as String,
      password: fields[6] as String,
      email: fields[7] as String,
      loc_long: fields[8] as String,
      loc_lat: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Driver obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.driverID)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.phoneNo)
      ..writeByte(4)
      ..write(obj.vehicleNo)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.loc_long)
      ..writeByte(9)
      ..write(obj.loc_lat);
  }
}
