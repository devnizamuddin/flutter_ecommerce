import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/home/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Create variable for google signin to firbase auth.
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogin = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //Check already Signed In or not
    //isSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            // Backround Imag
            child: Image.asset(
              'images/login_background.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            // Backround Imag
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.5),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            /*appBar: AppBar(
              elevation: 0.5,
              title: Text(
                'Login',
                style: TextStyle(color: Colors.red),
              ),
              centerTitle: true,
            ),*/
            body: Stack(
              children: <Widget>[
                Container(
                  //Login Input layout
                  alignment: Alignment.center,
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            // Email
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Email *',
                                      isDense: true,
                                      icon: Icon(Icons.alternate_email)),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailTextController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            //Password
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Password *',
                                      isDense: true,
                                      icon: Icon(Icons.lock_outline)),
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _passwordTextController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            //Password
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blue.withOpacity(0.8),
                                child: MaterialButton(
                                  onPressed: () {},
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                )),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          Text(
                            'Other Login Option',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            //Password
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.red.withOpacity(0.8),
                                child: MaterialButton(
                                  onPressed: () {
                                    handleSignIn();
                                  },
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Google',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: loading ?? true,
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(0.9),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void isSignedIn() async {
    //Seeing is user already signed in or not
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLogin = await _googleSignIn.isSignedIn();

    if (isLogin) {
      //user Loged in give him access to the app
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
      setState(() {
        loading = false;
      });
    }
  }

  Future handleSignIn() async {
    //If user not sign in
    //Handling user signIn
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    //Signing In
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    //Getting Google sign in auth
    GoogleSignInAuthentication signInAuthentication =
        await googleSignInAccount.authentication;
    //Getting Credential for Firebase auth.
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: signInAuthentication.idToken,
        accessToken: signInAuthentication.accessToken);
    //Auth result for User Information.
    AuthResult authResult =
        await _firebaseAuth.signInWithCredential(credential);
    FirebaseUser firebaseUser = authResult.user;

    if (firebaseUser != null) {
      //After signIn save data to the database
      final QuerySnapshot unerInfo = await Firestore.instance
          .collection("users")
          .where('id', isEqualTo: firebaseUser.uid)
          .getDocuments();
      List<DocumentSnapshot> documents = unerInfo.documents;
      if (documents.length == 0) {
        // User documents is not our database
        Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .setData({
          'id': firebaseUser.uid,
          'username': firebaseUser.displayName,
          'photoUrl': firebaseUser.photoUrl
        });

        await preferences.setString('id', firebaseUser.uid);
        await preferences.setString('username', firebaseUser.displayName);
        await preferences.setString('photoUrl', firebaseUser.photoUrl);
      } else {
        //If we find user data in the documents
        await preferences.setString('id', documents[0]['id']);
        await preferences.setString('username', documents[0]['username']);
        await preferences.setString('photoUrl', documents[0]['photoUrl']);
      }

      Fluttertoast.showToast(
        msg: 'Login Successful',
      );
      setState(() {
        loading = false;
      });
    }
  }
}
