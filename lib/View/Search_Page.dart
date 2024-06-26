import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/Cubits/Get_Data_Cubit/Get_Data_Cubit.dart';

class Search_Page extends StatelessWidget {
  Search_Page({super.key});
  String input = 'empty';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Search The City',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.deepPurple.shade300,
              Colors.deepPurple.shade50,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    input = value;
                    if (kDebugMode) {
                      print(input);
                    }
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      labelText: 'Search',
                      suffixIcon: const Icon(Icons.search),
                      hintText: 'Enter a City',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 80,
                  onPressed: () async {
                    if (input != 'empty' || input.isNotEmpty) {
                      var cubitdata = BlocProvider.of<Get_Data_Cubit>(context);
                      cubitdata.Get_Weather(cityname: input);
                      Navigator.pop(context);
                    } else {
                      const Center(
                        child: Text(
                          "City Not Valid",
                          style: TextStyle(fontSize: 30),
                        ),
                      );
                    }
                  },
                  color: Colors.deepPurple[400],
                  child: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
