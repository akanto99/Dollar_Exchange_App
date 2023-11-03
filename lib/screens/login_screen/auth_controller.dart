
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> signUpUser(
      String email,
      String fullName,
      String phoneNumber,
      String password,
      Uint8List? image,
      ) async {
    String res = 'Some error occurred';

    try {
      if (image == null) {
        res = 'Please provide a profile picture';
      } else if (!isValidEmail(email)) {
        res = 'Invalid email address';
      } else if (!isValidPhoneNumber(phoneNumber)) {
        res = 'Invalid phone number';
      } else if (!isStrongPassword(password)) {
        res = 'Password must be strong';
      } else {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String profileImageUrl = await _uploadProfileImageToStorage(image);
        await _firestore.collection('buyers').doc(cred.user!.uid).set({
          'email': email,
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'buyerId': cred.user!.uid,
          'address': '',
          'profileImage': profileImageUrl,
        });

        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  bool isValidEmail(String email) {
    // Implement your email validation logic here
    // Example: You can use regex or any other validation method
    // For simplicity, I'm checking if it contains "@" symbol
    return email.contains('@gmail.com');
  }

  bool isValidPhoneNumber(String phoneNumber) {
    // Implement your phone number validation logic here
    // Example: Check if it's 11 digits and starts with "1"
    return phoneNumber.length == 11 && phoneNumber.startsWith('01');
  }

  bool isStrongPassword(String password) {
    // Implement your password strength validation logic here
    // Example: Check if it has a minimum length, contains uppercase, lowercase,
    // numbers, and special characters
    return password.length >= 8 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[0-9]')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  Future<String> _uploadProfileImageToStorage(Uint8List image) async {
    Reference ref = _storage.ref().child('profilePics').child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
  pickProfileImage(ImageSource source) async{
    final ImagePicker _imagePicker = ImagePicker();

     XFile? _file = await _imagePicker.pickImage(source: source);

     if(_file != null){
       return await _file.readAsBytes();
     }else{
       print('No Image Selected');
     }
  }

  loginUsers(String email, String password) async{
    String res = 'Something went wrong';

    try {
      if (email.isNotEmpty &&
          password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = 'success';
      } else {
        res = 'Please Fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}


