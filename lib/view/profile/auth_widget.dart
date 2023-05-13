import 'dart:io';

import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/view/profile/register_screen.dart';
import 'package:eco_friendly/view/profile/user_profile_screen.dart';
import 'package:eco_friendly/view/root_screen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';

import '../../helpers/responsive.dart';
import '../../helpers/size_config.dart';



enum AuthMode {
  SignIn,
  SignUp
}
class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool hidePassword = true;
  var _authMode = AuthMode.SignIn;
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  final _passwordController = TextEditingController();
  Map <String, String> _authData = {
    'email':'',
    'password': '',
    'mobile':'',
    'address':'',

  };
  //User? user;

  void _switchAuthMode (){
    if(_authMode == AuthMode.SignIn){
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    }else{
      setState(() {
        _authMode = AuthMode.SignIn;
      });
    }
  }

  void _showErrorDialog (String message) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Error Occurred'),
        content: Text(message),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          },
              child: Text('Okay!'))
        ],
      );
    },);
  }

  Future<void> _submit() async{
    if(!_formKey.currentState!.validate()){
      return;
    }
    _formKey.currentState!.save();
    //print(_authData.values);
    setState(() {
      _isLoading = true;
    });

    try{
      if(_authMode == AuthMode.SignIn){
       await Provider.of<AuthenticationController>(context,listen: false).login(_authData['email']!, _authData['password']!);
        //await Provider.of<AuthenticationController>(context,listen: false).login(user!);
      }else{
        await Provider.of<AuthenticationController>(context, listen: false)
            .signup(_authData['email']!, _authData['password']!, _authData['mobile']!, _authData['address']!);
        //await Provider.of<AuthenticationController>(context, listen: false).signup(user!);
      }
    }on HttpException catch(error){
      var errorMessage = 'Authentication Failed';
      if(error.toString().contains('EMAIL_EXISTS')){
        errorMessage = 'E-Mail Exists';
      }else if(error.toString().contains('INVALID_EMAIL')){
        errorMessage = 'Invalid E-Mail';
      }else if(error.toString().contains('WEAK_PASSWORD')){
        errorMessage = 'Weak Password';
      }else if(error.toString().contains('EMAIL_NOT_FOUND')){
        errorMessage = 'E-Mail not Found';
      }else if(error.toString().contains('INVALID_PASSWORD')){
        errorMessage = 'Invalid Password';
        _showErrorDialog(errorMessage);
      }
    }catch(error){
      const errorMessage = 'Could not Authenticate you, Try again later';
      _showErrorDialog(error.toString());
    }



    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final auth = Provider.of<AuthenticationController>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
              width: Responsive.isWeb(context) ? width * 0.4 : width,
              margin: EdgeInsets.only(right: width * 0.05, left:width * 0.05 ),
              padding: EdgeInsets.all(width *0.05),
              decoration: BoxDecoration(
              //border: Border.all(color: pColor),
              borderRadius: BorderRadius.circular(8),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  cursorColor: mainColor,
                  decoration: InputDecoration(
                    hintText: 'example@example.com',
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if(value!.isEmpty || !value.contains('@')){
                      return 'E-Mail must be not empty and contain\'@\' \nand (.com)';
                    }
                  },
                  onSaved: (newValue) {
                    _authData['email'] = newValue!;
                    //user!.email = newValue;
                  },
                ),
                SizedBox(height: height * 0.02,),
                TextFormField(
                  cursorColor: mainColor,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                    suffixIcon: IconButton(
                       icon: Icon(Icons.visibility),
                      onPressed: (){
                         setState((){
                           hidePassword = !hidePassword;
                         });
                      },
                    )
                  ),
                  validator: (value) {
                    if(value!.isEmpty || value.length < 6){
                      return 'Enter Password OR your password \n less than 6 characters ';
                    }
                  },
                  onSaved: (newValue) {
                    _authData['password'] = newValue!;
                    //user!.password = newValue;
                  },

                ),
                SizedBox(height: height * 0.02,),
               if(_authMode == AuthMode.SignUp)
                 TextFormField(
                   cursorColor: mainColor,
                   decoration: InputDecoration(
                       labelText: 'Mobile number',
                       hintText: '0123456789',
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8)
                       )
                   ),
                   keyboardType: TextInputType.phone,
                   validator: (value){
                     if(value!.isEmpty || value.length < 6){
                       return 'No or your number must be more than 8 digits ';
                     }
                   },
                   onSaved: (newValue){
                     _authData['mobile'] = newValue!;
                     //user!.phoneNumber = newValue;
                   },
                 ),
                SizedBox(height: height * 0.02,),
               if(_authMode == AuthMode.SignUp)
                 TextFormField(
                   cursorColor: mainColor,
                   maxLines: 2,
                   decoration: InputDecoration(
                       labelText: 'Address',
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8)
                       )
                   ),
                   keyboardType: TextInputType.streetAddress,
                   validator: (value){
                     if(value!.isEmpty ){
                       return 'Please enter your full address';
                     }
                   },
                   onSaved: (newValue){
                     _authData['address'] = newValue!;
                     //user!.address = newValue;
                   },
                 ),
                SizedBox(height: height * 0.01,),
               ElevatedButton(
                   child: Text(_authMode == AuthMode.SignIn ? 'Sign In' : 'Sign Up'),
                   style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(mColor),
                     elevation: MaterialStateProperty.all(2),
                     padding:  Responsive.isWeb(context)
                         ? MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: width * 0.1, vertical: width * 0.015))
                         : MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: width * 0.3, vertical: height * 0.025))
                   ),
                   onPressed:(){
                     _submit();

                     Responsive.checkPlatform()
                         ? Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RootScreen(),))
                         : null;


                   //   Responsive.isWeb(context)?
                   //   Future(() => Future.delayed(Duration(seconds: 3)),).then((value) {
                   //     if(auth.isAuth){
                   //       Navigator.pushNamed(context, UserProfileScreen.USERPROFILESCREEN_ROUTE_NAME);
                   //       Navigator.pop(context, RegisterScreen.REGISTERSCREEN_ROUTE_NAME);
                   //     }
                   //   })
                   // :null;

                   }
                     ,)
              ],
            ),
          ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('${_authMode == AuthMode.SignIn ? 'Don\'t have an account?' : 'Already registered!'}'),
          TextButton(
              child: Text('${_authMode == AuthMode.SignIn ? 'Sign Up' : 'Sign In'}', style: TextStyle(fontSize: 15,),),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(mainColor),
              ),
              onPressed: _switchAuthMode, )
        ],)
      ],
    );
  }
}
