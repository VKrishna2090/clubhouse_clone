import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          icon: Icon(CupertinoIcons.compass),
          iconSize: 30.0,
          onPressed: () {},
        ),
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.envelope_open),
            iconSize: 27.0,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.calendar),
            iconSize: 30.0,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bell),
            iconSize: 30.0,
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/cat1.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: PageView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xffE6E2D6),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Card(
                          elevation: 0,
                          color: Color(0xffE6E2D6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: ListTile(
                            leading: Text(
                              'Tomorrow\n1:30',
                              textAlign: TextAlign.right,
                            ),
                            title: Text('COMMUNITY CLUB'),
                            subtitle: Text(
                              'Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/cat1.jpg'),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      title: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Room 1',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Participant 1'),
                              Text('Participant 2'),
                              Text('30 / 18 💬'),
                            ]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/cat1.jpg'),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      title: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Room 2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Participant 1'),
                              Text('Participant 2'),
                              Text('30 / 18 💬'),
                            ]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/cat1.jpg'),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      title: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Room 3',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Participant 1'),
                              Text('Participant 2'),
                              Text('30 / 18 💬'),
                            ]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text("+ Start a room", style: TextStyle(fontSize: 20)),
          backgroundColor: Colors.green,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
