import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  final TextEditingController _textEditingController = TextEditingController();
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text(
              'Alert!!',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            content: const Text("""
Please type something you haven't typed anything"""),
            actions: [
              MaterialButton(
                onPressed: () {},
                child: const Text("Button"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("cancel"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 151, 140, 219),
      appBar: AppBar(
        title: const Text(
          'New Event',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(255, 75, 57, 185),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Image(
                image: AssetImage('new.jpg'),
                width: 346,
                height: 80,
              ),
            ),
            Center(
              child: SizedBox(
                width: 182 * 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: TextField(
                    controller: _textEditingController,
                    textInputAction: TextInputAction.newline,
                    cursorColor: Colors.white,
                    maxLines: null,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 0,bottom: 1),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4000.0)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 75, 57, 185),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 75, 57, 185),
                      prefixIcon: Icon(
                        Icons.today_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      labelText: "Event",
                      // hintText: "Event",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Center(
                child: Builder(builder: (context) {
                  return ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(364, 48),
                        backgroundColor:
                            const Color.fromARGB(255, 185, 178, 231),
                        alignment: const Alignment(0, 0),
                        shadowColor: const Color.fromARGB(255, 185, 178, 231),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                    onPressed: () async {
                      String newEventText = _textEditingController.text;
                      if (newEventText.trim().isNotEmpty) {
                        Navigator.of(context).pop(newEventText);
                      } else {
                        _showDialog();
                      }
                    },
                    label: const Text(
                      "ADD",
                      style: TextStyle(
                          color: Color.fromARGB(255, 246, 246, 251),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    icon: const Icon(Icons.add_circle_rounded,
                        color: Colors.deepPurpleAccent),
                  );
                }),
              ),
            ),
          ]),
    );
  }
}
