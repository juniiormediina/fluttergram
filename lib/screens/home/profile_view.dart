part of app.home;

class ProfileView extends StatelessWidget {
  static String route = '${HomeView.route}/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Center(
                child: Text('Profile view'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentPage: MenuPage.profile,
      ),
    );
  }
}
