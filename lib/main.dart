import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Contador de pessoas",
    );
  }
}

// classe da pagina inicial
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // contador pro numero de pessoas na loja
  int count = 0;

  // funcao q decrementa o numero de pessoas na loja
  void decrement() {
    setState(() {
      count--;
    });
  }

  // funcao q incremneta o numero de pessoas na loja
  void increment() {
    setState(() {
      count++;
    });
  }

  // varf pra ver se ta cheio ou vazio e n passar de 20 ou ficar neg
  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/image.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isFull ? "Full" : "Pode entrar",
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w700,
                )),
            Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 100,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child:
                      Text("Saiu", style: TextStyle(color: Colors.pinkAccent)),
                ),
                SizedBox(
                  width: 30,
                ),
                TextButton(
                    onPressed: isFull ? null : increment,
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.red.withOpacity(0.6) : Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      "Entrou",
                      style: TextStyle(color: Colors.pinkAccent),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
