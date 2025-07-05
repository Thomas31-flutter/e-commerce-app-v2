import 'package:flutter/material.dart';

class CustomeListTile extends StatelessWidget {
  const CustomeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Image.asset("assets/images/download.jpeg", fit: BoxFit.cover),
      ),
      title: Text(
        "Hi Emily",
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      subtitle: Text("lets go shopping"),
      trailing: SizedBox(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.search, size: 40),
            Icon(Icons.notifications_outlined, size: 40),
          ],
        ),
      ),
    );
  }
}
