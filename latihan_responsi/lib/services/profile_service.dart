import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static const String profilePhotoKey = 'profile_photo';

  Future<void> saveProfilePhoto(String photoPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(profilePhotoKey, photoPath);
  }

  Future<String?> getProfilePhoto() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(profilePhotoKey);
  }

  Future<void> clearProfilePhoto() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(profilePhotoKey);
  }
}