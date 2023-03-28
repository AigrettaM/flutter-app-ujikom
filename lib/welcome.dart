import 'package:flutter/material.dart';
import 'package:rolebased/auth/login.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 40),
                child: Container(
                  height: 313,
                  width: 297,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Assets/Images/DRIP_19.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Hello!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Raleway_Semibold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Selamat Datang Di Aplikasi S'pPay",
                  style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontFamily: 'Raleway_Semibold'),
                ),
              ),
              Container(
                child: Text(
                  "Silahkan masuk dengan akun yang terdaftar!",
                  style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontFamily: 'Raleway_Semibold'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 40, 70, 0),
                child: Container(
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    height: 50.0,
                    minWidth: width,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    color: const Color.fromRGBO(49, 39, 79, 1),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway_Semibold',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
