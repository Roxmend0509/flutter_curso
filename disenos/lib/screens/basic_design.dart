import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Imagen Central
          Image(
            image: AssetImage('assets/landscape.jpeg'),
          ),
          //Titulo
          Title(),

          //Buttom Section
          ButtonSection(),

          //Description

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
                'Nostrud duis adipisicing et dolor pariatur aliqua sit pariatur voluptate ipsum irure velit. Dolore eu enim ex exercitation aute ad ex Lorem ipsum cillum. Ad occaecat esse Lorem aliquip commodo. Fugiat ea pariatur eiusmod cillum est mollit commodo Lorem esse. Ut eu commodo duis do. Dolor Lorem commodo magna ipsum aute consequat velit incididunt commodo. Pariatur ea nulla non laborum incididunt aliquip eu exercitation mollit.'),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.black45)),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.star, color: Colors.red),
          Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomeButton(icon: Icons.call, text: 'Call'),
          CustomeButton(icon: Icons.near_me, text: 'Route'),
          CustomeButton(icon: Icons.share, text: 'Share'),
        ],
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomeButton({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          this.icon,
          color: Colors.blue,
          size: 30,
        ),
        Text(this.text, style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}
