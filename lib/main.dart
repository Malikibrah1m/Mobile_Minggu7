import 'package:flutter/material.dart';
import 'package:acara26/form.dart';

void main() {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    home: Belajar(),
    debugShowCheckedModeBanner: false,
  ));
}

class Belajar extends StatefulWidget {
  const Belajar({super.key});

  @override
  State<Belajar> createState() => _BelajarState();
}

class _BelajarState extends State<Belajar> {
  final _formkey = GlobalKey<FormState>();
  double nilaiSlider = 1;
  bool nilaiCheckbox = false;
  bool nilaiSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar form flutter"),
        centerTitle: true,
      ),
      body: Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "contoh : Malik Ibrahim",
                    labelText: "Nama Lengkap",
                    icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                CheckboxListTile(
                  title: Text('Belajar Dasar Flutter'),
                  subtitle: Text('Dart, widget, Http'),
                  value: nilaiCheckbox,
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      nilaiCheckbox = value!;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Backend Programming'),
                  subtitle: Text('Dart, NodeJs, Java, PHP'),
                  value: nilaiSwitch,
                  activeTrackColor: Colors.pink,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      nilaiSwitch = value;
                    });
                  },
                ),
                Slider(
                  value: nilaiSlider,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      nilaiSlider = value;
                    });
                  },
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {}
                        },
                        child: Text("Submit"))),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      child: Text("Acara 27"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Baru()))),
                )
              ],
            ),
          )),
    );
  }
}
