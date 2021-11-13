part of app.home;

class TimelineView extends StatelessWidget {
  static String route = '${HomeView.route}';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AuthBLoC authBLoC = BlocProvider.of<AuthBLoC>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          //TODO: fix color on title header
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionsScreenHeigth(14),
            color: secondaryColor,
          ),
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
                child: BlocBuilder<AuthBLoC, AuthState>(
                  builder: (BuildContext context, AuthState state) => Row(
                    children: [
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: textColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.photo_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pepito Perez',
                          ),
                          Text(
                            state.user?.email ?? '',
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(currentPage: MenuPage.home),
    );
  }
}
