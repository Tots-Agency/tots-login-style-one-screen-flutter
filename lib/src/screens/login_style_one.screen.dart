import 'package:flutter/material.dart';
import 'package:tots_theme/tots_theme.dart';

class LoginStyleOneScreen extends StatefulWidget {

  final Function(String, String)? onLogin;
  final String? imageLogo;
  final String? title;
  final String? subtitle;
  final bool? isLoadingLogin;

  const LoginStyleOneScreen({Key? key, this.onLogin, this.imageLogo, this.title, this.subtitle, this.isLoadingLogin}) : super(key: key);

  @override
  _LoginStyleOneScreenState createState() => _LoginStyleOneScreenState();
}

class _LoginStyleOneScreenState extends State<LoginStyleOneScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  // State field(s) for EmailAddressField widget.
  TextEditingController? emailAddressFieldController;
  String? emailAddressFieldControllerValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required.';
    }

    /*if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }*/
    return null;
  }

  // State field(s) for PasswordField widget.
  TextEditingController? passwordFieldController;
  bool passwordFieldVisibility = false;
  String? passwordFieldControllerValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    emailAddressFieldController ??= TextEditingController();
    passwordFieldController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    emailAddressFieldController?.dispose();
    passwordFieldController?.dispose();

    _unfocusNode.dispose();

    super.dispose();
  }

  Widget _buildGoogleSignInButton() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFD0D5DD),
              width: 1,
            ),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: SelectionArea(
                        child: Text(
                      'Sign in with Google',
                      style: TotsTheme()
                          .bodyMedium()
                          .copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: OutlinedButton(
        onPressed: () async {
          if (formKey.currentState == null || !formKey.currentState!.validate() || widget.onLogin == null) {
            return;
          }

          widget.onLogin!(
            emailAddressFieldController?.text ?? '',
            passwordFieldController?.text ?? '',
          );
        },
        child: Container(
          width: double.infinity,
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: widget.isLoadingLogin != null && widget.isLoadingLogin! ? const CircularProgressIndicator() : Text('Log In', textAlign: TextAlign.center, style: TotsTheme().bodyMedium().copyWith(fontSize: 16,fontWeight: FontWeight.w600))
              )
            ]
          )
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
      child: SelectionArea(
          child: Text(
        'Forget password?',
        style: TotsTheme().bodyMedium().copyWith(
              color: TotsTheme().primaryColor,
              fontWeight: FontWeight.w600,
            ),
      )),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SelectionArea(
                  child: Text(
                'Password',
                style: TotsTheme()
                    .bodyMedium()
                    .copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
            child: TextFormField(
              controller: passwordFieldController,
              obscureText: !passwordFieldVisibility,
              decoration: InputDecoration(
                labelStyle: TotsTheme()
                    .bodyMedium()
                    .copyWith(
                      color: TotsTheme().primaryText,
                      fontSize: 16,
                    ),
                hintText: '••••••••',
                hintStyle: TotsTheme()
                    .bodyMedium()
                    .copyWith(
                      fontFamily: 'Inter',
                      color: TotsTheme().secondaryText,
                      fontSize: 16,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFD0D5DD),
                    width: 1,
                  ),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFFDA29B),
                    width: 1,
                  ),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFFDA29B),
                    width: 1,
                  ),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsetsDirectional.fromSTEB(14, 10, 14, 10),
                suffixIcon: InkWell(
                  onTap: () => setState(
                    () => passwordFieldVisibility = !passwordFieldVisibility,
                  ),
                  focusNode:
                      FocusNode(skipTraversal: true),
                  child: Icon(
                    passwordFieldVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: TotsTheme().secondaryText,
                    size: 16,
                  ),
                ),
              ),
              style: TotsTheme()
                  .bodyMedium()
                  .copyWith(
                    color: TotsTheme().primaryText,
                    fontSize: 16,
                  ),
              validator: passwordFieldControllerValidator,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SelectionArea(
                child: Text(
              'Email',
              style: TotsTheme().bodyMedium().copyWith(fontWeight: FontWeight.w500),
            )),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
          child: TextFormField(
            controller: emailAddressFieldController,
            obscureText: false,
            decoration: InputDecoration(
              labelStyle: TotsTheme()
                  .bodyMedium()
                  .copyWith(
                    color: TotsTheme().primaryText,
                    fontSize: 16,
                  ),
              hintText: 'Enter your email',
              hintStyle: TotsTheme()
                  .bodyMedium()
                  .copyWith(
                    color: TotsTheme().secondaryText,
                    fontSize: 16,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFD0D5DD),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFFDA29B),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFFDA29B),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsetsDirectional.fromSTEB(14, 10, 14, 10),
            ),
            style: TotsTheme()
                .bodyMedium()
                .copyWith(
                  color: TotsTheme().primaryText,
                  fontSize: 16,
                ),
            keyboardType: TextInputType.emailAddress,
            validator: emailAddressFieldControllerValidator,
          ),
        ),
      ],
    );
  }

  Widget _buildSubtitle() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: SelectionArea(
          child: Text(widget.subtitle!,
            style: TotsTheme().bodySmall(),
      )),
    );
  }

  Widget _buildTitle() {
    return SelectionArea(
      child: Text(
      widget.title!,
      style: TotsTheme().headlineSmall().copyWith(
          fontSize: 30,
          fontWeight: FontWeight.w600)
    ));
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: TotsTheme().secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(widget.imageLogo!).image,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: Color(0x1917171C),
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: TotsTheme().primaryBackground,
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 360,
              decoration: const BoxDecoration(),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.imageLogo != null ? _buildLogo() : Container(),
                    widget.title != null ? _buildTitle() : Container(),
                    widget.subtitle != null ? _buildSubtitle() : Container(),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            _buildEmailField(),
                            _buildPasswordField(),
                          ],
                        ),
                      ),
                    ),
                    _buildForgotPassword(),
                    _buildLoginButton(),
                    //_buildGoogleSignInButton(),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectionArea(
                              child: Text(
                            'Don\'t have an account? ',
                            style: TotsTheme()
                                .bodyMedium()
                                .copyWith(
                                  color: TotsTheme().secondaryText,
                                ),
                          )),
                          SelectionArea(
                              child: Text(
                            'Sign up',
                            style: TotsTheme()
                                .bodyMedium()
                                .copyWith(
                                  color: TotsTheme().primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}