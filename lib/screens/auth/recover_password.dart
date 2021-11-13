part of app.auth;

class RecoverPasswordView extends StatefulWidget {
  static String route = '${AuthView.route}/recoverPassword';

  _RecoverPasswordViewState createState() => _RecoverPasswordViewState();
}

class _RecoverPasswordViewState extends State<RecoverPasswordView> {
  final NavigatorService navigator = locator<NavigatorService>();
  TextEditingController emailController = TextEditingController();

  String? emailError;
  bool get disableButton =>
     (emailController.text.isEmpty && emailError==null) || emailError=='invalid email';

  void navigateToSignUp() {
    navigator.push(route: SignUpView.route, key: navigator.authNavigatorKey);
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendResetPassWord(String email){
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  void onValidateEmail(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    bool isValid = regex.hasMatch(email.trim());
    setState(() {
      isValid ? emailError = null : emailError = 'invalid email';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(
              fontSize: getProportionsScreenHeigth(14), color: secondaryColor),
        ),
              centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              Text(
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionsScreenHeigth(28),
                ),
              ),
              Text(
                'Please enter your email and we will send\n you a link to return to your account',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.08,
              ),
              Input(
                label: 'email',
                icon: Icons.email_outlined,
                placeholder: 'add your email',
                onChange: onValidateEmail,
                error: emailError,
                controller: emailController,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.10,
              ),
              Button(
                label: 'Send',
                onPress: () {
                  sendResetPassWord(emailController.text);
                 },
                disable: disableButton,
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                  ),
                  InkWell(
                    onTap: navigateToSignUp,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: primaryColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
