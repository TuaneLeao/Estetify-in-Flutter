import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool _isButton1Selected = false;
  bool _isButton2Selected = false;

  void _toggleButton1() {
    setState(() {
      _isButton1Selected = !_isButton1Selected;
      if(_isButton2Selected){
        _isButton2Selected = false;
      }
    });
  }

  void _toggleButton2() {
    setState(() {
      _isButton2Selected = !_isButton2Selected;
      if(_isButton1Selected){
        _isButton1Selected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: _isButton1Selected ? Colors.yellow : Colors.white,
            ),
            onPressed: _toggleButton1,
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: _isButton2Selected ? Colors.yellow : Colors.white,
            ),
            onPressed: _toggleButton2,
          ),
        ],
      ),
      
      body:  CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.person, size: 30, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: ListTile(
                      leading: ClipOval(
                        child: SizedBox(
                          width: 35,
                          height: 35,
                          child: Icon(Icons.person),
                        ),
                      ),
                      title: Text(
                        'username',
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle: Text(
                        'location',
                        style: TextStyle(fontSize: 10),
                      ),
                      trailing: Icon(Icons.more_horiz),
                    ),
                  ),
                );
              },
              childCount: 18,
            ),
          ),
        ],
      ),
        
      // bottomNavigationBar: Navigation(),
    );
  }
}
