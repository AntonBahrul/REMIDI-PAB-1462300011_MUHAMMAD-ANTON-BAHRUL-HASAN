import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static User? get currentUser => _auth.currentUser;

  // Halaman Daftar -> membuat akun baru lalu simpan profil ke Firestore
  static Future<String?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      try {
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'name': name,
          'email': email,
          'photoUrl': '',
          'instagram': '-',
        });
      } on FirebaseException catch (e) {
        // Akun Auth sudah terbuat, tapi gagal simpan ke Firestore.
        // Biasanya karena Security Rules atau database belum dibuat.
        return 'Akun berhasil dibuat tapi gagal simpan profil: ${e.message ?? e.code}';
      }

      return null; // null artinya sukses, tidak ada pesan error
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Gagal mendaftar';
    } catch (e) {
      return 'Terjadi kesalahan: $e';
    }
  }

  // Halaman Login
  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Gagal login';
    }
  }

  // Halaman Forgot Password -> "Send to email"
  static Future<String?> sendResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Gagal mengirim email reset';
    }
  }

  // Tombol Log Out di Halaman Profile
  static Future<void> logout() async {
    await _auth.signOut();
  }
}
