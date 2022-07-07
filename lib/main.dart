import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';

import 'package:workinv2/Screens/SplashScreen.dart';
import 'package:workinv2/Screens/CvUploadScreen.dart';

import 'package:workinv2/constants.dart';
import 'package:workinv2/controllers/applyJob.dart';
import 'package:workinv2/controllers/companyCreateReview.dart';
import 'package:workinv2/controllers/companyPrivateReview.dart';
import 'package:workinv2/controllers/companySignupTwo.dart';
import 'package:workinv2/controllers/company_getCategoryJobs.dart';
import 'package:workinv2/controllers/company_getJobs.dart';
import 'package:workinv2/controllers/homescreen_getjobs.dart';
import 'package:workinv2/controllers/personalInfo.dart';
import 'package:workinv2/controllers/userPrivateInfo.dart';


import 'controllers/AppliedUser.dart';
import 'controllers/InviteUsers.dart';
import 'controllers/JobDetails.dart';
import 'controllers/JobsAppliedFor.dart';
import 'controllers/companyPublicProfile.dart';
import 'controllers/companySignup.dart';
import 'controllers/editJob.dart';
import 'controllers/personalInfo2.dart';
import 'controllers/signup.dart';

import 'package:provider/provider.dart';

void main()async{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Auth>(create:(_)=>Auth()),
    ChangeNotifierProvider<companyAuth>(create:(_) =>companyAuth()),
    ChangeNotifierProvider<companyAuth2>(create:(_) =>companyAuth2()),
    ChangeNotifierProvider<personalInfoAuth>(create:(_) =>personalInfoAuth()),
    ChangeNotifierProvider<personalInfoAuth2>(create:(_) =>personalInfoAuth2()),
    ChangeNotifierProvider<companyDetailView>(create:(_) =>companyDetailView()),
    ChangeNotifierProvider<companyReviews>(create:(_) =>companyReviews()),
    ChangeNotifierProvider<companyCreateReview>(create:(_) =>companyCreateReview()),
    ChangeNotifierProvider<companyJobs>(create:(_) =>companyJobs()),
    ChangeNotifierProvider<userDetailView>(create:(_) =>userDetailView()),
    ChangeNotifierProvider<homeView>(create:(_) =>homeView()),
    ChangeNotifierProvider<categoryJobs>(create:(_) =>categoryJobs()),
    ChangeNotifierProvider<jobApply>(create:(_) =>jobApply()),
    ChangeNotifierProvider<postfile>(create:(_) =>postfile()),
    ChangeNotifierProvider<jobDetailView>(create:(_) =>jobDetailView()),
    ChangeNotifierProvider<AppliedUserView>(create:(_) =>AppliedUserView()),
    ChangeNotifierProvider<InviteUserView>(create:(_) =>InviteUserView()),
    ChangeNotifierProvider<jobsAppliedForView>(create:(_) =>jobsAppliedForView()),
    ChangeNotifierProvider<Edit>(create:(_) =>Edit()),
    // ChangeNotifierProvider<gethome>(create:(_) =>gethome()),
  ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: [
          Locale('en','US')
        ],
        localizationsDelegates: [
          CountryLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: scaffoldcolor),




        home:splashScreen()

    );
  }
}


