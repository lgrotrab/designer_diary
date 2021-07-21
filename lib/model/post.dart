class post {
  final String title;
  final String description;
  final String mainImage;
  final String profilePicture;
  final String username;
  post(
      {required this.title,
      required this.description,
      required this.mainImage,
      required this.profilePicture,
      required this.username});
  String getTitle() {
    return this.title;
  }

  String getDescription() {
    return this.description;
  }

  String getUsername() {
    return this.username;
  }

  String getImage() {
    return this.mainImage;
  }

  String getProfilepicture() {
    return this.profilePicture;
  }
}
