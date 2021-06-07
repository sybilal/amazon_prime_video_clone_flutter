import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  static const routeName = '/about';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<void> _launched;

  String _phone = '+971506831407';

  String toLaunch = 'mailto:sbilalahmed95@gmail.com';

  Future<void> _launchInBrowser(String url) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sbilalahmed95@gmail.com',
      queryParameters: {'subject': 'Opportunity'},
    );

    launch(_emailLaunchUri.toString());
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 20,
                    child: Image(
                      width: 80,
                      image: AssetImage('assets/images/prime_logo.png'),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.pink,
                    backgroundImage: AssetImage('assets/images/bilal.jpg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Bilal Syed',
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                  SizedBox(
                    height: 30,
                    width: 140,
                    child: Divider(color: Colors.white),
                  ),
                  generateCard(
                      '+97 150 683 1407', Icons.contact_phone, 'phone'),
                  SizedBox(
                    height: 20,
                  ),
                  generateCard('sbilalahmed95@gmail.com', Icons.email, 'email'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  generateCard(String myTitle, IconData myIcon, String type) {
    return Card(
      color: Color(0xff1d1f33),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      child: ListTile(
        onTap: () {
          setState(() {
            if (type == 'email') {
              _launched = _launchInBrowser(toLaunch);
            } else {
              _launched = _makePhoneCall('tel:$_phone');
            }
          });
        },
        leading: Icon(
          myIcon,
          color: Colors.white,
        ),
        title: Text(
          myTitle,
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
