import"package:flutter/material.dart";
class ButtonWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      icon: const Icon(
        Icons.tag_faces,
        color: Colors.white,
      ),
      label: const Text('Button'),
      onPressed: () {},
      color: Colors.green,
      textColor: Colors.white,
    );
  }
}
