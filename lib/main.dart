import 'package:flutter/material.dart';
import 'rent_page.dart';
import 'pg_page.dart';
import 'find_roommate_page.dart';
import 'listing_for_roommate_page.dart';
import 'put_up_listing_page.dart';
import 'blog_page.dart';

void main() {
  runApp(NestopiaApp());
}

class NestopiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nestopia',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/rent': (context) => RentPage(),
        '/pg': (context) => PGPage(),
        '/find_roommate': (context) => FindRoommatePage(),
        '/listing_for_roommate': (context) => ListingForRoommatePage(),
        '/put_up_listing': (context) => PutUpListingPage(),
        '/blogs': (context) => BlogPage(),
        '/chatbot': (context) => ChatBotPage(),
        '/saved': (context) => SavedPage(),
        '/myprofile': (context) => MyProfilePage(),
      },
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Nestopia',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: 'ComicNeue',
        ),
      ),
      backgroundColor: Colors.lightBlue[800],
      centerTitle: true,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MyBottomNavigationBar extends StatelessWidget {
  final String currentRoute;

  const MyBottomNavigationBar({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightBlue[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              if (currentRoute != '/') {
                Navigator.pushNamed(context, '/');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              if (currentRoute != '/saved') {
                Navigator.pushNamed(context, '/saved');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              if (currentRoute != '/chatbot') {
                Navigator.pushNamed(context, '/chatbot');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              if (currentRoute != '/myprofile') {
                Navigator.pushNamed(context, '/myprofile');
              }
            },
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.0),
          Center(
            child: Text(
              'Welcome to Nestopia!',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'ComicNeue',
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey, size: 30.0),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 30.0),
                          decoration: InputDecoration.collapsed(hintText: 'Search...'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                HomeButton(title: 'Rent', route: '/rent'),
                SizedBox(height: 12.0),
                HomeButton(title: 'PG', route: '/pg'),
                SizedBox(height: 12.0),
                HomeButton(title: 'Find Roommate', route: '/find_roommate'),
                SizedBox(height: 12.0),
                HomeButton(title: 'Listing for Roommate', route: '/listing_for_roommate'),
                SizedBox(height: 12.0),
                HomeButton(title: 'Put up Listing', route: '/put_up_listing'),
                SizedBox(height: 12.0),
                HomeButton(title: 'Blogs', route: '/blogs'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentRoute: '/'),
    );
  }
}



class HomeButton extends StatelessWidget {
  final String title;
  final String route;

  const HomeButton({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}


class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUserMessage: true));
      // Sample response for the user's message
      _messages.insert(0, ChatMessage(text: 'Thank you for your message!', isUserMessage: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, index) {
                return _messages[index];
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentRoute: '/chatbot'),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  const ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Row(
        mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 250),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isUserMessage ? Colors.blueAccent : Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              text,
              style: TextStyle(color: isUserMessage ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                SavedItem(name: 'Beautiful House', cost: '₹20000', image: 'house_image_1.jpg'),
                SavedItem(name: 'Cozy Apartment', cost: '₹15000', image: 'apartment_image_1.jpg'),
                SavedItem(name: 'Spacious Room', cost: '₹5000', image: 'room_image_1.jpg'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentRoute: '/saved'),
    );
  }
}

class SavedItem extends StatelessWidget {
  final String name;
  final String cost;
  final String image;

  const SavedItem({required this.name, required this.cost, required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('Cost: $cost'),
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/$image'),
      ),
    );
  }
}

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: MyProfileForm(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentRoute: '/myprofile'),
    );
  }
}

class MyProfileForm extends StatefulWidget {
  @override
  _MyProfileFormState createState() => _MyProfileFormState();
}

class _MyProfileFormState extends State<MyProfileForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create Your Profile', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 20.0),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: _phoneController,
          decoration: InputDecoration(labelText: 'Phone Number'),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Implement logic to create profile
          },
          child: Text('Create Profile'),
        ),
      ],
    );
  }
}
