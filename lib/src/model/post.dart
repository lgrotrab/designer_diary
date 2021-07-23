class Post {
  final String title;
  final String description;
  final String mainImage;
  final String profilePicture;
  final String username;
  Post(Post post,
      {required this.title,
      required this.description,
      this.mainImage =
          'https://pm1.narvii.com/6250/5df4c9226b3ba2ca841889eaa4ff82be05cca390_00.jpg',
      this.profilePicture =
          'https://isaojose.com.br/wp-content/uploads/2020/12/blank-profile-picture-mystery-man-avatar-973460.jpg',
      required this.username});

  Post.fromMap(Map<dynamic, dynamic> value)
      : title = value['title'],
        username = value['username'],
        mainImage = value['main_image'],
        profilePicture = value['profile_picture'],
        description = value['description'];

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
