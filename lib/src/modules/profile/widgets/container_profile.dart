import 'package:flutter/material.dart';

class ContainerProfile extends StatelessWidget {
  const ContainerProfile({
    super.key,
    this.user,
  });

  final dynamic user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(
          width: 4,
          color: Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          )
        ],
        shape: BoxShape.circle,
        image: user != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(user),
              )
            : const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/profile.png"),
              ),
      ),
    );
  }
}
