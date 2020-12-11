import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Photo {
  Future<File> getPhoto() async {
    try {
      var pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      return pickedFile;
    } catch (e) {
      print(e);
    }
  }

  Future<String> uploadPhoto(File image) async {
    try {
      String filename = basename(image.path);

      StorageReference storageReference =
          FirebaseStorage.instance.ref().child("users/${filename}");
      StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      String imgUrl = await storageReference.getDownloadURL();
      print(imgUrl);
      return imgUrl;
    } catch (e) {
      print(e);
    }
  }
}
