import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workinv2/Screens/Categories_Screen.dart';
import 'package:workinv2/Screens/homeListView_Screen.dart';
import 'package:workinv2/Screens/login_Screen.dart';
import 'package:workinv2/Screens/singnup_Screen.dart';
import 'package:workinv2/Screens/userPrivateProfile_Screen.dart';
import 'package:workinv2/constants.dart';
import 'package:workinv2/controllers/companyPublicProfile.dart';
import 'package:workinv2/controllers/company_getCategoryJobs.dart';
import 'package:workinv2/controllers/homescreen_getjobs.dart';
import 'package:workinv2/controllers/userPrivateInfo.dart';
import '../controllers/applyJob.dart';
import 'JobDetailsScreen.dart';
import 'companySignup_Screen.dart';
import 'search.dart';



class realHomeScreen extends StatefulWidget {
  const realHomeScreen({Key? key}) : super(key: key);

  @override
  _realHomeScreenState createState() => _realHomeScreenState();
}

class _realHomeScreenState extends State<realHomeScreen> {
  Widget showLoginAndRegister(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen(),));
        }, child: Text('login'),style: ElevatedButton.styleFrom(primary: primarycolor),),
        SizedBox(width: 10,),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
        }, child: Text('Register'),style: ElevatedButton.styleFrom(primary: primarycolor),),
      ],
    );

  }


  List<String>images=['assets/images/it.jpg','assets/images/Advertising.jpg','assets/images/marketing.jpg','assets/images/art.jpg'];
  List<String>categories=['Engineering','Advertising','Marketing','Art and Design'];

  late final Future myFuture;
  @override
  void initState() {


    myFuture=fetchHomedetails();
  }
  var _isloading=false;

  String islogd="";
  String? login;
  bool _iscompany=false;




  Future<void>fetchHomedetails()async{
      final prefs= await SharedPreferences.getInstance();
      if(prefs.getString('mail')==null){
        prefs.setString('mail', "");
      }
      islogd=prefs.getString('mail')!;
      Provider.of<homeView>(context,listen: false).deletelist();
    await Provider.of<homeView>(context,listen: false).fetchhomeDetails('','',islogd);




  }
  // Future<void>gotomyprofile()async{
  //   await Provider.of<userDetailView>(context,listen: false).fetchUserDetails(islogd);
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => userPrivateProfile(),));
  // }
  String mail='';
  String category='';
  Future<void>allcategories(String mail,String cat)async{
    Provider.of<categoryJobs>(context,listen: false).delete();
    await Provider.of<categoryJobs>(context,listen: false).fetchCategoryjobs(mail,cat);
    Navigator.push(context, MaterialPageRoute(builder: (context) => categoryJobList(),));
  }
  Future<String>getprefs()async{
    final prefs= await SharedPreferences.getInstance();
    login=prefs.getString('mail')!;
    return login!;

  }
  Future<void>fetchuserinfo(String email)async{

    await Provider.of<userDetailView>(context,listen: false).fetchUserDetails(email);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => userPrivateProfile()),);
  }
  int id=0;
  Future<void>gotojob(int id)async{
    await Provider.of<jobApply>(context,listen: false).See(id);
    Navigator.push(context, MaterialPageRoute(builder: (context) => jobDetailsScreen(),));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: scaffoldcolor,
        title: FutureBuilder(
          future: getprefs(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.data==''){
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen(),));
                  }, child: Text('login'),style: ElevatedButton.styleFrom(primary: primarycolor),),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                  }, child: Text('Register'),style: ElevatedButton.styleFrom(primary: primarycolor),),
                ],
              );

            }else{
              return Text('$login',style: GoogleFonts.nunito(color: Colors.black),);
            }
          },
        ),

      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.077,
              decoration: BoxDecoration(
                  border:Border.all(color: Colors.black)
              ),
              child: DrawerHeader(child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(onPressed: () {

                  }, child: Text('Main Menu',style: GoogleFonts.nunito(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),))
                ],
              ),decoration: BoxDecoration(
                  color: scaffoldcolor
              ),padding: EdgeInsets.all(5),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: getprefs(),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.data==''){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => companySignupScreen()),);

                          }, child: Text('Start Hiring',style: GoogleFonts.nunito(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),//start hiring
                        ],
                      );

                    }else{
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(onPressed: () async{
                            SharedPreferences prefs =await SharedPreferences.getInstance();
                            fetchuserinfo(prefs.getString('mail')!);
                          }, child: Text('My Profile',style: GoogleFonts.nunito(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),//my profile

                          TextButton(onPressed: () async{
                            final prefs= await SharedPreferences.getInstance();
                            prefs.setString('mail','');
                            prefs.setString('token','');
                            prefs.setString('isCompany','');
                            Navigator.of(context).pushAndRemoveUntil(
                              // the new route
                              MaterialPageRoute(
                                builder: (BuildContext context) => realHomeScreen(),
                              ),

                              // this function should return true when we're done removing routes
                              // but because we want to remove all other screens, we make it
                              // always return false
                                  (Route route) => false,
                            );
                          }, child: Text('Logout',style: GoogleFonts.nunito(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),//logout
                        ],
                      );
                    }
                  },
                ),



              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(5),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 250,
                child: Image.asset('assets/images/Artboard 3.png'),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async{
                    await showSearch(context: context, delegate: searchit());

                  },
                  child: Row(
                    children: [
                      Text('Search',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black),)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(primary:Colors.white),
                ),
              ),
              SizedBox(height: 10,),
              Text('Latest Jobs',style: GoogleFonts.nunito(fontSize: 25,fontWeight: FontWeight.bold),),
              FutureBuilder(
                future: myFuture,
                builder: (BuildContext context,AsyncSnapshot snapshot,){
                  if(snapshot.connectionState==ConnectionState.done){
                  return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2 / 2.6,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async{
                            final prefs=await SharedPreferences.getInstance();
                            id=Provider.of<homeView>(context,listen: false).jobidis[index];
                            prefs.setInt('id', id);

                            print(id);
                            gotojob(id);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(

                              children: [
                                SizedBox(height: 10,),
                                CircleAvatar(radius: 33,backgroundImage:NetworkImage(Provider.of<homeView>(context,listen: false).logo[index]),backgroundColor: Colors.grey,),
                                SizedBox(height: 5,),
                                Text('${Provider.of<homeView>(context,listen: false).compname[index]}',style: GoogleFonts.nunito(fontSize: 15,color: Colors.white),),
                                SizedBox(height: 5,),
                                Text('${Provider.of<homeView>(context,listen: false).jobtitle[index]}',style: GoogleFonts.nunito(fontSize: 15,color: Colors.white)),
                                SizedBox(height: 5,),
                                Text('${Provider.of<homeView>(context,listen: false).jobtype[index]}',style: GoogleFonts.nunito(fontSize: 15,color: Colors.white),),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        );
                      }),
                );}else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

              }
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homeJobList()),);
                  },
                  child: Container(width: MediaQuery.of(context).size.width,height: 165,decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: primarycolor ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Browse All Jobs',style: GoogleFonts.nunito(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_forward_outlined,size: 50,color: Colors.white,),
                            ],
                          )
                        ],
                      ),

                    ],
                  ),),
                ),
              ),
              Text('Browse By Category',style: GoogleFonts.nunito(fontSize: 25,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 20),
                    itemCount: 4,
                    itemBuilder: (BuildContext ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () async{
                              final prefs=await SharedPreferences.getInstance();
                              mail=prefs.getString('mail')!;
                              category=categories[index];
                              allcategories(mail,category);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Image.asset(images[index]),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(categories[index],style: GoogleFonts.nunito(fontSize: 15),)
                        ],
                      );
                    }),
              ),

            ],
          ),
        ),),
      ),
    );
  }
}

