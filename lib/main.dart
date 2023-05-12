import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Projeto 1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(leading: Container(), title: Text('Tarefas')),
          body: AnimatedOpacity(
            opacity: opacity ? 0 : 1,
            duration: Duration(milliseconds: 500),
            child: ListView(
              children: [
                Task(
                    'Jogar Basquete',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6_vzy81kM5QaCCb6Qqn7bHq5jowC1_AqQ_g&usqp=CAU',
                    2),
                Task(
                    'Estudar Para Prova',
                    'https://s1.static.brasilescola.uol.com.br/be/conteudo/images/o-estudo-diario-segredo-bom-desempenho-escolar-1317739140.jpg',
                    4),
                Task(
                    'Aprender Flutter',
                    'https://yt3.googleusercontent.com/ytc/AL5GRJVFUbrqLgTKs3qvoiGiZDvJHXkB_pzHwyussmGX=s900-c-k-c0x00ffffff-no-rj',
                    3),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                opacity = !opacity;
              });
            },
            child: Icon(
                opacity ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
          ),
        ));
  }
}

class Task extends StatefulWidget {
  final String name;
  final String url;
  final int dificulty;

  const Task(this.name, this.url, this.dificulty, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.blue),
            height: 144,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4)),
                      height: 144,
                      width: 72,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 200,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 23,
                                  overflow: TextOverflow.ellipsis),
                            )),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificulty >= 1)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificulty >= 2)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificulty >= 3)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificulty >= 4)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificulty >= 5)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              level++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificulty > 0)
                            ? (level / widget.dificulty) / 10
                            : 1,
                      ),
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nivel: $level',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
