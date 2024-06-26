import 'package:flutter/material.dart';

class NO_Data_Page extends StatelessWidget {
  const NO_Data_Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          const Text(
            'No Weather Data  😞',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("searchpage");
            },
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4, 4),
                    color: Colors.grey.shade500,
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    offset: Offset(-4, -4),
                    color: Color.fromARGB(255, 255, 255, 255),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Text(
                'Search The City',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
          Container(
            alignment: Alignment.center,
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 4),
                  color: Colors.grey.shade500,
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  offset: Offset(-4, -4),
                  color: Color.fromARGB(255, 255, 255, 255),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const Text(
              'Auto Select ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
