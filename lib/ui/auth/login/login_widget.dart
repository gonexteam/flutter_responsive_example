import 'package:flutter/material.dart';
import 'package:flutter_responsive/config/style.dart';
import 'package:flutter_responsive/helpers/ui_helper.dart';
import 'package:flutter_responsive/routing/router_names.dart';
import 'package:flutter_responsive/services/navigation_service.dart';

class LoginWidget {
  Widget _textField(String label, {bool isSecure = false}) {
    return TextField(
      decoration: InputDecoration(
          // hintText: label,
          label: Text(label),
          border: const OutlineInputBorder()),
      obscureText: isSecure,
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLogo(),
            _textField('Username'),
            UIHelper.vertical(size: 16),
            _textField('Password', isSecure: true),
            UIHelper.vertical(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {}, child: const Text("Forgot password?"))
              ],
            ),
            UIHelper.vertical(),
            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  NavigationService().pushNamed(homeRoute);
                },
                style: primaryOutlineButton,
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMobile(context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: _buildForm(context),
    );
  }

  Widget buildLarger(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          constraints: const BoxConstraints(maxWidth: 400),
          child: _buildForm(context),
        )
      ],
    );
  }
}
