import 'package:flutter/material.dart';
import 'add_todo.dart';
import 'database.dart';
import 'details_page.dart';
import 'update_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<DataModel> todos = [];
  bool fetching = true;
  final db = NewDatabase();

  @override
  void initState() {
    super.initState();
    db.initDB();
    getData2();
  }

  getData2() async {
    todos = await db.getData();
    setState(() {
      fetching = false;
    });
  }

  deleteTodo(int id) {
    todos.removeWhere((item) => item.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.newspaper),
        title: const Text('To Do'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title:Text('ID: ${todos[index].id}'),
                subtitle: Text('USER ID: ${todos[index].userId}'),
                onTap: () async{
                  var update = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(data: todos[index])
                      )
                  );
                  if (update == true){
                    setState(() {
                    });
                  }
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () async{
                          var update = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateTodo(data: todos[index])
                              )
                          );
                          if (update == true){
                            setState(() {
                            });
                          }
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          final snackBar = SnackBar(
                              content: Text('ID: ${todos[index].id} Deleted Successfully')
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          int idNum = todos[index].id;
                          setState(() {
                            deleteTodo(idNum);
                            db.delete(idNum);
                          });
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            );
         }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var postTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddTodo()
              )
          );
          if (postTodo!=null){
            setState(() {
              todos.add(postTodo);
              db.insertData(postTodo);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}