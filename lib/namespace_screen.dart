import 'package:flutter/material.dart';

class name_card extends StatefulWidget {
  const name_card({Key? key}) : super(key: key);

  @override
  State<name_card> createState() => _name_cardState();
}

class _name_cardState extends State<name_card> with TickerProviderStateMixin {
  late Animation animation1;
  late AnimationController _controller1;

  late Animation<Offset> offset;
  late AnimationController _controller2;

  late Animation<Color?> color_animation;
  late AnimationController _controller3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller1 = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    animation1 = CurvedAnimation(
      parent: _controller1,
      curve: Curves.bounceIn,
    );

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 2))
        .animate(_controller2);

    color_animation = ColorTween(
      begin: Colors.teal,
      end: Colors.red,
    ).animate(_controller3);

    _controller1.forward();

    _controller1.addListener(() {
      setState(() {});
    });

    _controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller2.forward();
      }
    });

    _controller2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller3.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_animation.value,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/b/b1/Beautiful-landscape.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: animation1.value * 100,
                backgroundImage: NetworkImage(
                    'data:image/jpeg;base64,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'),
              ),
              Text(
                'Lakshay Chaudhary',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'SOFTWARE DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: offset,
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '+12 012 345 67',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'lakshay6632@gmail.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 17.0,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
