import 'package:coffee_app/screens/signin.dart';
import 'package:coffee_app/screens/widgets/bottom_navigation.dart';
import 'package:coffee_app/screens/widgets/custom_button.dart';
import 'package:coffee_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;
    BottomNavigationBarType _bottomNavType = BottomNavigationBarType.shifting;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.060,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Profile',
                    style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(height: 20),
                  itemProfile(
                    'Name',
                    'Mohamad Handika Nurfadli',
                    Icons.person,
                  ),
                  const SizedBox(height: 15),
                  itemProfile('Email', 'handikafadli23@gmail.com', Icons.email),
                  const SizedBox(height: 15),
                  itemProfile('Phone', '087784526', Icons.phone),
                  const SizedBox(height: 15),
                  itemProfile(
                      'Rekening Bank', '34734193888281', Iconsax.personalcard),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      title: 'Logout',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SimpleBottomNavigation(
        currentIndex: _selectedIndex,
        selectedItemColor: brownColor,
        unselectedItemColor: const Color(0xff757575),
        type: _bottomNavType,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.grey.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          ),
        ),
        leading: Icon(
          iconData,
          color: brownColor,
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
