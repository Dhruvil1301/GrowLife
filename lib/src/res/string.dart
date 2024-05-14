class BaseApi{
   static const Apikey="https://growlife-whel.onrender.com/api/v1";
}
class Api{
   static const _base=BaseApi.Apikey;
   static const SignUp="$_base/auth/signup";
   static const SaveUser="$_base/auth/saveuser";
   static const SignIn="$_base/auth/login";
   static const Forgot="$_base/auth/generateotp";   //forgot passsword generate otp
   static const ForgotOtp="$_base/auth/validateotp";     //forgot password validate otp
   static const ChangePassword="$_base/auth/changepassword";  //for new password
   static const GetUrl="$_base/user/uploadurl"; //url for upload image
   static const GetProfile="$_base/user/profile";  //Profile Details
   static const UpdateProfile="$_base/user/updateuser";
   static const GetVideoUrl="$_base/video/uploadurl";
  static const SaveVideoApi="$_base/video/getvideo";
  static const GetMyAllVideos="$_base/video/getallvideo";
  static const GetAllUser="$_base/user/get-all-users/";
  static const FollowApi="$_base/user/follow";
   static const UnFollowApi="$_base/user/unfollow";
   static const feedApi="$_base/video/feeds";
   static const likeApi="$_base/video/like-video";
   static const singleVideoApi="$_base/video/single-video";
   static const addCpmmentApi="$_base/video/comment/add-comment";

}