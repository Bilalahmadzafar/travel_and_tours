import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Check if user is signed in
  bool get isSignedIn => _auth.currentUser != null;

  /// Get user email
  String? get userEmail => _auth.currentUser?.email;

  /// Get user display name
  String? get userName => _auth.currentUser?.displayName;

  // ---------------------------------------------------------------------------
  // AUTH METHODS
  // ---------------------------------------------------------------------------

  /// Email/Password Sign-Up
  Future<User?> signUp(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw 'This email is already registered.';
        case 'invalid-email':
          throw 'Please enter a valid email address.';
        case 'weak-password':
          throw 'Password must be at least 6 characters long.';
        default:
          throw 'Sign-up failed: ${e.message}';
      }
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }

  /// Email/Password Sign-In
  Future<User?> signIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw 'No account found with this email.';
        case 'wrong-password':
          throw 'Incorrect password. Please try again.';
        default:
          throw 'Sign-in failed: ${e.message}';
      }
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }

  /// Google Sign-In
  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User cancelled

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await _auth.signInWithCredential(credential);
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw 'Google Sign-In failed: ${e.message}';
    } catch (e) {
      throw 'An unexpected error occurred during Google Sign-In: $e';
    }
  }

  /// Sign Out (works for both email/password and Google users)
  Future<void> signOut() async {
    await _auth.signOut();
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
  }

  // ---------------------------------------------------------------------------
  // EXTRA FEATURES (OPTIONAL BUT USEFUL)
  // ---------------------------------------------------------------------------

  /// Send password reset email
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw 'Password reset failed: ${e.message}';
    }
  }

  /// Delete user account
  Future<void> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw 'Account deletion failed: ${e.message}';
    }
  }

  /// Update display name
  Future<void> updateDisplayName(String name) async {
    try {
      await _auth.currentUser?.updateDisplayName(name);
      await _auth.currentUser?.reload();
    } on FirebaseAuthException catch (e) {
      throw 'Update failed: ${e.message}';
    }
  }

  /// Update profile photo
  Future<void> updateProfilePhoto(String photoUrl) async {
    try {
      await _auth.currentUser?.updatePhotoURL(photoUrl);
      await _auth.currentUser?.reload();
    } on FirebaseAuthException catch (e) {
      throw 'Profile update failed: ${e.message}';
    }
  }
}
