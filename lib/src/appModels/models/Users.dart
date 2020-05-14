//import 'ParseBaseModels.dart';
//
//class FacebookProfile {
//  final String facebookId;
//  final String name;
//  final String email;
//  final myAuthData;
//
//  FacebookProfile(this.facebookId, this.name, this.email, this.myAuthData);
//}
//
//class TwitterProfile {
//  final String twitterId;
//  final String username;
//  final String displayName;
//  final String email;
//  final myAuthData;
//
//  TwitterProfile(this.twitterId, this.username, this.displayName, this.email,
//      this.myAuthData);
//}
//
//class ParseModelUsersLinker extends ParseCommonModel {
//  final String username;
//
//  ParseModelUsersLinker(
//      creator,
//      String uniqueId,
//      DateTime createdAt,
//      DateTime updatedAt,
//      DateTime syncPostedAt,
//      String flag,
//      String objectSchemaName,
//      String id,
//      this.username)
//      : super(creator, uniqueId, createdAt, updatedAt, syncPostedAt, flag,
//            objectSchemaName, id);
//}
//
//class ParseModelUsersAuthData {
//  final facebook;
//  final twitter;
//
//  ParseModelUsersAuthData(this.facebook, this.twitter);
//}
//
//class ParseModelUsers extends ParseModelUsersLinker {
//  final String displayName;
//  final String slug;
//  final String loginType;
//  final String email;
//  final bool emailVerified;
//
//  // social
//  final String facebook_id;
//  final String twitter_id;
//  final String twitterHandle;
//
//  // User profile background
//  final String coverId;
//  final coverUrls;
//
//  // Linking
//  final bool facebookLinked;
//  final bool twitterLinked;
//  final authData; // ParseModelUsersAuthData
//  // Verification
////  sign_up_email_verify_token?;
////  sign_up_email_verify_token_expires_at?; DateTime
////  deletion_email_verify_token?;
////  deletion_email_verify_token_expires_at?; DateTime
////  reset_email_verify_token?;
////  reset_email_verify_token_expires_at?; DateTime
////  defaultAvatarUrl?;
//
//  final listPhotosDict;
//
//  ParseModelUsers(
//      creator,
//      String uniqueId,
//      DateTime createdAt,
//      DateTime updatedAt,
//      DateTime syncPostedAt,
//      String flag,
//      String objectSchemaName,
//      String id,
//      String username,
//      this.displayName,
//      this.slug,
//      this.loginType,
//      this.email,
//      this.emailVerified,
//      this.facebook_id,
//      this.twitter_id,
//      this.twitterHandle,
//      this.coverId,
//      this.coverUrls,
//      this.facebookLinked,
//      this.twitterLinked,
//      this.authData,
//      this.listPhotosDict)
//      : super(creator, uniqueId, createdAt, updatedAt, syncPostedAt, flag,
//            objectSchemaName, id, username); // IListPhotosDict<String>
//}
