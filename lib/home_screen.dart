import 'package:flutter/material.dart';
import 'package:web_view/web_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> pages = [
    'COVID-19 Ex-Gratia Payment Login',
    'RURAL LAND RECORD (ગ્રામ્ય જમીનનો રેકર્ડ)',
    'URBAN LAND RECORD (શહેરી જમીનનો રેકર્ડ)',
    'Digitally Signed RoR Login',
    'Online Applications',
    'About Chief Minister Relief Fund',
    'જિલ્લા હેલ્પ-ડેસ્ક (iORA) ની વિગત',
    'અરજીની વિગતો',
  ];

  List<String> urls = [
    'https://iora.gujarat.gov.in/cov19_login.aspx',
    'https://anyror.gujarat.gov.in/LandRecordRural.aspx',
    'https://anyror.gujarat.gov.in/emilkat/GeneralReport_IDB.aspx',
    'https://iora.gujarat.gov.in/ror_online.aspx',
    'https://iora.gujarat.gov.in/OnlineAppl.aspx',
    'https://iora.gujarat.gov.in/cmrf/',
    'https://iora.gujarat.gov.in/helpdesk.aspx',
    'https://e-milkat.gujarat.gov.in/ioraonlinepcard/ioraonlinepcard.aspx',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnyRoR'),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      WebViewScreen(pages[index], urls[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    pages[index],
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
