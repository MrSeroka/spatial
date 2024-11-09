import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:spatial/app/auth/user_model.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  String? errorMessage;

  // Image Picker
  File? _profilePicture;
  File? get profilePicture => _profilePicture;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _profilePicture = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> signUp(String firstName, String surname, String email, String phone) async {
    setBusy(true);
    try {
      // Sign up with Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: 'defaultpassword123', // Consider using a stronger password strategy
      );

      // Upload image to Firebase Storage
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      TaskSnapshot uploadTask = await _storage
          .ref('profile_pictures/$fileName')
          .putFile(_profilePicture!);
      String downloadUrl = await uploadTask.ref.getDownloadURL();

      // Save user data to Firestore
      UserModel user = UserModel(
        firstName: firstName,
        surname: surname,
        email: email,
        phone: phone,
        profilePictureUrl: downloadUrl,
      );
      await _firestore.collection('users').doc(userCredential.user!.uid).set(user.toMap());

      setBusy(false);
    } catch (e) {
      errorMessage = e.toString();
      setBusy(false);
    }
  }
}
