import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:patinha_app/src/core/constants/const_navigators.dart';
import 'package:patinha_app/src/modules/userPostPage/user_post_page.dart';

import '../../core/theme/patinha_perdida_theme.dart';
import '../feed/post/post_page.dart';
import '../help/help_page.dart';
import 'widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pageController = PageController();
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Drawer
      drawer: MyDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: PatinhaPerdidaTheme.violetDark),
        backgroundColor: PatinhaPerdidaTheme.greyLigth,
        //Boas vindas
        centerTitle: true,
        title: Text(
          "Patinha Perdida",
          style: TextStyle(
            color: PatinhaPerdidaTheme.violetDark,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(PPNavigators.userProfile, arguments: {
                'user': user,
              }),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : AssetImage('assets/images/logo-app.png') as ImageProvider,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          PostPage(),
          UserPostsPage(
            userId: user!.uid,
          ),
          HelpPage(),
        ],
      ),

      //BottomNavigationBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: GNav(
          gap: 8,
          activeColor: PatinhaPerdidaTheme.violetDark,
          padding: const EdgeInsets.all(16),
          onTabChange: (index) {
            setState(
              () {
                currentIndex = index;
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn,
                );
              },
            );
          },
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              iconColor: PatinhaPerdidaTheme.violetLigth,
              text: 'Home',
            ),
            GButton(
              icon: Icons.pets_sharp,
              iconColor: PatinhaPerdidaTheme.violetLigth,
              text: 'Relatos',
            ),
            GButton(
              icon: Icons.help,
              iconColor: PatinhaPerdidaTheme.violetLigth,
              text: 'Meus relatos',
            ),
          ],
        ),
      ),

      //Botão flutuante
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: PatinhaPerdidaTheme.violetDark,
        extendedPadding: EdgeInsets.all(16),
        onPressed: () async {
          //  Validações
          // Navigator.of(context).pushNamed('/report/first');
          Navigator.of(context).pushNamed('/map');
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          "Relatar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
