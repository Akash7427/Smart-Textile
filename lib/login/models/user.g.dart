// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      ethnicWear: (fields[0] as List)?.cast<String>(),
      apparelAndGarments: (fields[1] as List)?.cast<String>(),
      saree: (fields[2] as List)?.cast<String>(),
      state: fields[3] as String,
      gstNum: fields[4] as String,
      categories: (fields[5] as List)?.cast<String>(),
      fabrics: (fields[6] as List)?.cast<String>(),
      logo: fields[7] as String,
      name: fields[8] as String,
      rating: fields[9] as String,
      companyName: fields[10] as String,
      email: fields[11] as String,
      type: fields[12] as String,
      address: fields[13] as String,
      city: fields[14] as String,
      phoneNo: fields[15] as String,
      establishmentYear: fields[16] as String,
      deviceToken: fields[17] as String,
      pincode: fields[18] as String,
      kurti: (fields[19] as List)?.cast<String>(),
      dress: (fields[20] as List)?.cast<String>(),
      uid: fields[21] as String,
      website: fields[22] as String,
      description: fields[23] as String,
      favouriteProducts: (fields[26] as List)?.cast<String>(),
      favouriteUsers: (fields[25] as List)?.cast<String>(),
      products: (fields[24] as List)?.cast<String>(),
      cities: (fields[27] as List)?.cast<String>(),
      billGenerated: (fields[28] as List)?.cast<String>(),
      billRecieved: (fields[29] as List)?.cast<String>(),
      qrcode: (fields[30] as List)?.cast<String>(),
      certificates: (fields[31] as List)?.cast<String>(),
      connection: (fields[32] as List)?.cast<String>(),
      newConnection: (fields[33] as List)?.cast<String>(),
      sendConnection: (fields[34] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(35)
      ..writeByte(0)
      ..write(obj.ethnicWear)
      ..writeByte(1)
      ..write(obj.apparelAndGarments)
      ..writeByte(2)
      ..write(obj.saree)
      ..writeByte(3)
      ..write(obj.state)
      ..writeByte(4)
      ..write(obj.gstNum)
      ..writeByte(5)
      ..write(obj.categories)
      ..writeByte(6)
      ..write(obj.fabrics)
      ..writeByte(7)
      ..write(obj.logo)
      ..writeByte(8)
      ..write(obj.name)
      ..writeByte(9)
      ..write(obj.rating)
      ..writeByte(10)
      ..write(obj.companyName)
      ..writeByte(11)
      ..write(obj.email)
      ..writeByte(12)
      ..write(obj.type)
      ..writeByte(13)
      ..write(obj.address)
      ..writeByte(14)
      ..write(obj.city)
      ..writeByte(15)
      ..write(obj.phoneNo)
      ..writeByte(16)
      ..write(obj.establishmentYear)
      ..writeByte(17)
      ..write(obj.deviceToken)
      ..writeByte(18)
      ..write(obj.pincode)
      ..writeByte(19)
      ..write(obj.kurti)
      ..writeByte(20)
      ..write(obj.dress)
      ..writeByte(21)
      ..write(obj.uid)
      ..writeByte(22)
      ..write(obj.website)
      ..writeByte(23)
      ..write(obj.description)
      ..writeByte(24)
      ..write(obj.products)
      ..writeByte(25)
      ..write(obj.favouriteUsers)
      ..writeByte(26)
      ..write(obj.favouriteProducts)
      ..writeByte(27)
      ..write(obj.cities)
      ..writeByte(28)
      ..write(obj.billGenerated)
      ..writeByte(29)
      ..write(obj.billRecieved)
      ..writeByte(30)
      ..write(obj.qrcode)
      ..writeByte(31)
      ..write(obj.certificates)
      ..writeByte(32)
      ..write(obj.connection)
      ..writeByte(33)
      ..write(obj.newConnection)
      ..writeByte(34)
      ..write(obj.sendConnection);
  }
}
