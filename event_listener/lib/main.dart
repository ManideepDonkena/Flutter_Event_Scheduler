import 'package:flutter/material.dart';
import 'package:event_listener/new_event.dart';

void main() => runApp(const Home());

//scaffold widget
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _list = [ ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',

      home: Scaffold(
        appBar: AppBar(
          title: const Text(' Event Scheduler ',
            style: TextStyle(color: Colors.white),
          ),
          // centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 75, 57, 185),
        ),
        body: ListView.builder(
          itemCount: _list.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          itemBuilder: ((context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom:20,left: 12,right: 12),
              padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
              alignment: const Alignment(0, 0),
              // color: const Color.fromARGB(255, 75, 57, 185),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                  // shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  )),
              child: _list[index],
            );
          }),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () async {
              String newEvent = await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Event()))
              as String;
              setState(() {
                _list.add(
                    Text(
                      newEvent,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        height: 1.3,
                        overflow: TextOverflow.clip,
                      ),
                    )
                );
              });
            },
            backgroundColor:  const Color.fromARGB(255, 75, 57, 185),
            child: const Text(
              '+',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          );
        }),
      ),
      theme: ThemeData(

        colorScheme: ThemeData().colorScheme.copyWith(primary: const Color.fromARGB(255, 75, 57, 185),),
        scaffoldBackgroundColor: const Color.fromARGB(255, 151, 140, 219),
      ),
    );
  }
}
