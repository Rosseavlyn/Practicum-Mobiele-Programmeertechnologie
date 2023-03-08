import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 70),
              child: FlutterLogo(
                size: 150,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),

                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Log In'),
                onPressed: () {},
              )
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Pw?',
                  style: TextStyle(color: Colors.grey[600]),
                ))
          ],
        ),
      ),
    );
  }
}