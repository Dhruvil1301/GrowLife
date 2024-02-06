
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:growlife/src/feature/aboutus/view/aboutus.dart';
import 'package:growlife/src/feature/costumersupport/view/Contact.dart';
import 'package:growlife/src/feature/editprofile/view/edituserdetails.dart';
import 'package:growlife/src/feature/event/view/events.dart';
import 'package:growlife/src/feature/event/view/widgets/Donation.dart';
import 'package:growlife/src/feature/event/view/widgets/eventdetails.dart';
import 'package:growlife/src/feature/event/view/widgets/registration.dart';
import 'package:growlife/src/feature/feedback/view/feedback.dart';
import 'package:growlife/src/feature/help/view/help.dart';
import 'package:growlife/src/feature/help/view/widgets/helpquestion.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/home/view/widgets/videodetail.dart';
import 'package:growlife/src/feature/invite/view/invite_a_friend.dart';
import 'package:growlife/src/feature/library/view/library.dart';
import 'package:growlife/src/feature/order/view/myorder.dart';
import 'package:growlife/src/feature/order/view/widgets/orderdetail.dart';
import 'package:growlife/src/feature/order/view/widgets/ordersummary.dart';
import 'package:growlife/src/feature/permission/view/notificationscreen.dart';
import 'package:growlife/src/feature/post/view/widgets/location.dart';
import 'package:growlife/src/feature/post/view/widgets/uploadfile.dart';
import 'package:growlife/src/feature/privacypolicy/view/privacypolicy.dart';
import 'package:growlife/src/feature/profile/view/profile.dart';
import 'package:growlife/src/feature/profile/view/widgets/userdetailscreen.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/feature/shopping/view/widgets/edit_address.dart';
import 'package:growlife/src/feature/shopping/view/widgets/paymentmethod.dart';
import 'package:growlife/src/feature/shopping/view/widgets/plants.dart';
import 'package:growlife/src/feature/shopping/view/widgets/product.dart';
import 'package:growlife/src/feature/shopping/view/widgets/product_detail.dart';
import 'package:growlife/src/feature/term_condition/view/term&condition.dart';
import 'package:growlife/src/feature/welcome/view/welcomescreen.dart';
final GoRouter router=GoRouter(
    initialLocation:UserDetailScreen.routePath,
    routes: [
      GoRoute(
        path: ProductDetail.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const ProductDetail();
        },
      ),
      GoRoute(
        path: Shopping.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Shopping();
        },

      ),
      GoRoute(
        path: Products.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Shopping();
        },
      ),
      GoRoute(
        path: Plants.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Plants();
        },
      ),
      GoRoute(
        path: MyOrder.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const MyOrder();
        },

      ),
      GoRoute(
        path: WelcomeScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },

      ),
      GoRoute(
        path: NotificationScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationScreen();
        },

      ),
      GoRoute(
        path: VideoDetailScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const VideoDetailScreen();
        },

      ),
      GoRoute(
        path: Library.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Library();
        },

      ),
      GoRoute(
        path: Setting.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Setting();
        },

      ),
      GoRoute(
        path: Profile.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Profile();
        },

      ),
      GoRoute(
        path: OrderSummary.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const OrderSummary();
        },

      ),
      GoRoute(
        path: PaymentMethod.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const PaymentMethod();
        },

      ),
      GoRoute(
        path: EditAddress.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const EditAddress();
        },

      ),
      GoRoute(
        path: Registration.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Registration();
        },

      ),
      GoRoute(
        path: Donation.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Donation();
        },

      ),
      GoRoute(
        path: Events.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Events();
        },

      ),
      GoRoute(
        path: EventDetails.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const EventDetails();
        },

      ),
      GoRoute(
        path: EditProfile.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const EditProfile();
        },

      ),
      GoRoute(
        path: InviteAFriend.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const InviteAFriend();
        },

      ),
      GoRoute(
        path: HomeScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  HomeScreen();
        },
      ),
      GoRoute(
        path: Help.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const Help();
        },
      ),
      GoRoute(
        path: AboutUs.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const AboutUs();
        },
      ),
      GoRoute(
        path: PrivacyPolicy.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const PrivacyPolicy();
        },
      ),
      GoRoute(
        path: TermandCondition.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const TermandCondition();
        },
      ),
      GoRoute(
        path: ContactUs.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const ContactUs();
        },
      ),
      GoRoute(
        path: HelpQuestion.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const HelpQuestion();
        },
      ),
      GoRoute(
        path: OrderDetail.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const OrderDetail();
        },
      ),
      GoRoute(
        path: AddFeedback.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const AddFeedback();
        },
      ),
      GoRoute(
        path: UserDetailScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const UserDetailScreen();
        },
      ),
      GoRoute(
        path: VideoGridView.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const VideoGridView();
        },
      ),
      GoRoute(
        path: PostLocation.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return  const PostLocation();
        },
      ),
    ]
);