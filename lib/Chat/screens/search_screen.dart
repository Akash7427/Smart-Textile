import 'package:provider/provider.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:smarttextile/Chat/resources/auth_methods.dart';

import 'package:smarttextile/Chat/screens/chatscreens/chat_screen.dart';
import 'package:smarttextile/Chat/utils/universal_variables.dart';
import 'package:smarttextile/Chat/widgets/custom_tile.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/shared/provider_user.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final AuthMethods _authMethods = AuthMethods();

  List<User> userList;
  String query = "";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _authMethods.getCurrentUser().then((FirebaseUser user) {
      _authMethods.fetchAllUsers(user).then((List<User> list) {
        setState(() {
          userList = list;
        });
      });
    });
  }

  searchAppBar(BuildContext context) {
    return GradientAppBar(
      gradient: LinearGradient(
        colors: [
          UniversalVariables.gradientColorStart,
          UniversalVariables.gradientColorEnd,
        ],
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            controller: searchController,
            onChanged: (val) {
              setState(() {
                query = val;
              });
            },
            cursorColor: UniversalVariables.blackColor,
            autofocus: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => searchController.clear());
                },
              ),
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0x88ffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildSuggestions(String query) {
    final List<User> suggestionList = query.isEmpty
        ? []
        : userList != null
            ? userList.where((User user) {
                String _getUsername = user.companyName.toLowerCase();
                String _query = query.toLowerCase();
                String _getName = user.name.toLowerCase();
                bool matchesUsername = _getUsername.contains(_query);
                bool matchesName = _getName.contains(_query);

                return (matchesUsername || matchesName);

                // (User user) => (user.username.toLowerCase().contains(query.toLowerCase()) ||
                //     (user.name.toLowerCase().contains(query.toLowerCase()))),
              }).toList()
            : [];

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: ((context, index) {
        User searchedUser = User(
            email: suggestionList[index].email,
            uid: suggestionList[index].uid,
            logo: suggestionList[index].logo,
            name: suggestionList[index].name,
            companyName: suggestionList[index].companyName);

        return CustomTile(
          index: index,
          mini: false,
          onTap: () {
            print("uid" + searchedUser.uid);
            print("name:- " + searchedUser.name);
            print("username:- " + searchedUser.companyName);
            print("profilePhoto:- " + searchedUser.logo);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen(receiver: searchedUser,)));
          },
          leading: searchedUser.logo != null
          ?          
          CircleAvatar(
            backgroundImage: NetworkImage(searchedUser.logo),
          )
          :
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          title: Text(
            searchedUser.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            searchedUser.email,
            style: TextStyle(color: UniversalVariables.greyColor),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //appBar: searchAppBar(context),
        body: Stack(
          children: <Widget>[buildSuggestions(query), searchappbar(context)],
        ));
  }

  Widget searchappbar(BuildContext context) {
    
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Color(0xffE4E4E4), blurRadius: 5)],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeConfig.safeBlockVertical * 70),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 10),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  width: 25,
                ),
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.start,
                    controller: searchController,
                    onChanged: (val) {
                      setState(() {
                        query = val;
                      });
                    },
                    cursorColor: UniversalVariables.blackColor,
                    //autofocus: true,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Search",
                      hintStyle: GoogleFonts.lato(
                        color: Color(0xff707070),
                        fontSize: 12.0,
                      ),
                      fillColor: Color(0xffE5E5E5),
                      contentPadding: EdgeInsets.only(left: 15),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                              (_) => searchController.clear());
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel",
                      style: TextStyle(color: Colors.red, fontSize: 16)),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          )),
    );
  }
}
