import 'package:flutter/material.dart';
import 'package:insta_clone/dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Instagram Clone"),
          ),
      body: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        "LOG IN",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white.withOpacity(0.8)),
                      )),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    createInputField(context, "Name",
                        icon: Icons.supervised_user_circle),
                    createInputField(context, "Email",
                        icon: Icons.email_rounded),
                    createInputField(context, "Password",
                        icon: Icons.privacy_tip_outlined),
                    createInputField(context, "Confirm Password",
                        icon: Icons.verified_outlined),
                  ],
                )),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Or Sign up with"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaIcon(
                            color: Colors.pink,
                          ),
                          SocialMediaIcon(
                            color: Colors.blue,
                          ),
                          SocialMediaIcon(
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        color: Colors.amber[900],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0)
                              .copyWith(right: 64, left: 64),
                          child: Text(
                            "SIGN UP",
                            style: Theme.of(context).textTheme.button.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white10,
              child: Padding(
                padding:
                    const EdgeInsets.all(16.0).copyWith(left: 84, right: 84),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Terms of use",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white)),
                    Text("Privacy Policy",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createInputField(BuildContext context, String name, {IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            color: Colors.green,
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.5, 0.5),
                  spreadRadius: 2,
                  blurRadius: 2)
            ]),
        child: TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
              prefixIcon: icon != null
                  ? Container(
                      color: Colors.white12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          icon,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.white12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.access_alarm,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16.0),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
              hintText: name),
        ),
      ),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final Color color;
  SocialMediaIcon({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: this.color,
          ),
          width: 50,
          height: 50),
    );
  }
}
