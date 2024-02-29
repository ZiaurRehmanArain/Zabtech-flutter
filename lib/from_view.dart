import 'package:flutter/material.dart';
import 'package:fromvalidation/home_view.dart';

class FromView extends StatefulWidget {
  FromView({super.key});

  @override
  State<FromView> createState() => _FromViewState();
}

class _FromViewState extends State<FromView> {
  GlobalKey<FormState> _from = GlobalKey<FormState>();

  var gender = 'male';
  var checkbox = false;

  var dorpdown = [
    'first',
    'second',
    'third',
    
  ];

  var dropdownitem = 'first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/image/loginImage.jpg'),
                height: 200,
              ),
              Form(
                  key: _from,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (v) {
                            if (v.toString().isEmpty) {
                              return 'please enter your name';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 231, 229, 229),
                              filled: true,
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val.toString().isEmpty) {
                              return 'please enter email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Email',
                              fillColor:
                                  const Color.fromARGB(255, 231, 229, 229),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (v) {
                            if (v.toString().isEmpty) {
                              return 'please enter password';
                            } else if (v.toString().length < 6) {
                              return 'please atleast 6 character';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              fillColor:
                                  const Color.fromARGB(255, 231, 229, 229),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 'male',
                                groupValue: gender,
                                onChanged: (val) {
                                  gender = val.toString();
                                  setState(() {});
                                  print(val);
                                }),
                            Text('Male')
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 'female',
                                groupValue: gender,
                                onChanged: (val) {
                                  print(val);
                                  setState(() {});
                                  gender = val.toString();
                                }),
                            Text('Female')
                          ],
                        ),
                        DropdownButton(
                          
                            value: dropdownitem,
                            items: dorpdown.map((e) {
                              return DropdownMenuItem(value: e, child: Text(e));
                            }).toList(),
                            onChanged: (v) {
                              dropdownitem = v.toString();
                              setState(() {
                                
                              });
                            }),
                        Row(
                          children: [
                            Checkbox(
                                value: checkbox,
                                onChanged: (v) {
                                  checkbox = !checkbox;
                                  setState(() {});
                                }),
                            Text('I agree')
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_from.currentState!.validate()) {
                                // print('welcome');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeView()));
                              }
                            },
                            child: Text('sign Up'))
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
