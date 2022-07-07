import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workinv2/Screens/companyProfileScreen_public.dart';
import 'package:workinv2/Screens/cvUploadScreen.dart';
import 'package:workinv2/Screens/home_Screen.dart';
import 'package:workinv2/Screens/userPrivateProfile_Screen.dart';
import 'package:workinv2/controllers/companyPrivateReview.dart';
import 'package:workinv2/controllers/company_getJobs.dart';
import 'package:workinv2/controllers/homescreen_getjobs.dart';
import 'package:workinv2/controllers/userPrivateInfo.dart';
import '../controllers/AppliedUser.dart';
import '../controllers/InviteUsers.dart';
import '../controllers/JobDetails.dart';
import '../controllers/JobsAppliedFor.dart';
import '../controllers/companyPublicProfile.dart';
import 'AppliedUserScreen.dart';
import 'CareerInfo_Screen.dart';
import 'InviteUsersScreen.dart';
import 'JobDetailsScreen.dart';
import 'JobsAppliedForScreenn.dart';
import 'companyProfileScreen_private.dart';
import 'companySignupTwo_Screen.dart';
import 'companySignup_Screen.dart';
import 'singnup_Screen.dart';
import 'personalInfo_Screen.dart';
import 'package:workinv2/constants.dart';
import 'package:provider/provider.dart';
import 'confirmPassword_Screen.dart';
import 'forgotPassword_Screen.dart';
import 'companyInfo_Screen.dart';
import 'login_Screen.dart';
import 'verification_Screen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}


class _homeScreenState extends State<homeScreen> {
  String usermail='';
  // Future<void>fetchcompdetails()async{
  //
  //   await Provider.of<companyDetailView>(context,listen: false).fetchDetails();
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => companyPublicProfile()),);
  //
  //
  // }
  Future<void>fetchHomedetails()async{

    await Provider.of<homeView>(context,listen: false).fetchhomeDetails('','','');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => realHomeScreen()),);


  }
  // Future<void>fetchcompdetailsprv()async{
  //
  //   await Provider.of<companyDetailView>(context,listen: false).fetchDetails();
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => companyPrivateProfile()),);
  //
  //
  // }
  //
  // Future<void>fetchcompdetails2()async{
  //
  //   await Provider.of<companyReviews>(context,listen: false).fetchReviews();
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => companyPrivateProfile()),);
  //
  //
  // }
  // Future<void>fetchcompdetails2prv()async{
  //
  //   await Provider.of<companyReviews>(context,listen: false).fetchReviews();
  //
  //
  //
  // }
  // Future<void>fetchcompjobs()async{
  //
  //   await Provider.of<companyJobs>(context,listen: false).fetchjobs();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => companyPublicProfile()),);
  //
  //
  // }
  // Future<void>fetchcompjobsprv()async{
  //
  //   await Provider.of<companyJobs>(context,listen: false).fetchjobs();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => companyPrivateProfile()),);
  //
  //
  // }
  Future<void>fetchuserinfo()async{
    final prefs=await SharedPreferences.getInstance();
    usermail=prefs.getString('usermail')!;

    await Provider.of<userDetailView>(context,listen: false).fetchUserDetails(usermail);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => userPrivateProfile()),);


  }
  Future<void> fetchJobDetails() async{
    await Provider.of<jobDetailView>(context,listen: false).fetchJobDetails();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => jobDetailsScreen()),);
  }
  // Future<void> fetchAppliedUsers() async{
  //   await Provider.of<AppliedUserView>(context,listen: false).fetchAppliedUsers();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => appliedUsersScreen()),);
  // }
  // Future<void> fetchInviteUsers() async{
  //   await Provider.of<InviteUserView>(context,listen: false).fetchInviteUsers();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => inviteUsersScreen()),);
  // }

  Future<void> fetchJobsAppliedFor() async{
    await Provider.of<jobsAppliedForView>(context,listen: false).fetchJobsAppliedForView();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => jobsAppliedForScreen()),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Login Screen
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Login Screen", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),

              //Forget Password Screen
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPass()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "ForgetPass Screen", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),

              //Change Password Screen
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmPassScreen()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "ChangePass Screen", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),

              //Company Info Screen
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Onboard()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "CompanyInfo Screen", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),

              //Verification Screen
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerficationScreen()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Verification Screen", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),

              //SignUp Screen
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "SignUp Screen", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),

              //Company SignUp Screen
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => companySignupScreen()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Company SignUp Screen", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),

              //Company SignUp 2 Screen
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => companySignupTwo()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Company SignUp2 Screen", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  // fetchcompdetails();
                  // fetchcompdetails2();
                  // fetchcompjobs();

                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Company public profile", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  // fetchcompdetailsprv();
                  // fetchcompdetails2prv();
                  // fetchcompjobsprv();

                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Company private profile", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),

              // //userCareerInfoScreen
              // MaterialButton(
              //   minWidth: 285,
              //   color: primarycolor,
              //   height: 50,
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => UserCompanyInfo()),);
              //   },
              //   elevation: 0,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(50),
              //
              //   ),
              //   child: Text(
              //       "Career Info", style: GoogleFonts.nunito(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   )
              //   ),
              //
              // ),
              SizedBox(height: 10,),

              //userCareerInfoScreen
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => personalInfoScreen()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Personal Info", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: (){
                  fetchuserinfo();
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "User Private profile", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  fetchHomedetails();
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Home Screen", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),

              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserCompanyInfo()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Career Info", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CvUploadScreen()),);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Cv upload", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  fetchJobDetails();
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "job detail", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  // fetchAppliedUsers();
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Applied users", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  fetchJobsAppliedFor();
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Job Applied for", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: 285,
                color: primarycolor,
                height: 50,
                onPressed: () {
                  // fetchInviteUsers();
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Text(
                    "Invite Users", style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),

              ),


            ],
          ),
        ),
      ),
    );
  }
}