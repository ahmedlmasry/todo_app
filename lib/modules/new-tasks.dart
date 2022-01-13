import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_pp/layout/cubit/cubit.dart';
import 'package:todo_pp/layout/cubit/states.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return ConditionalBuilder(
            condition: tasks.length > 0,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) =>
                    buildTaskItem(tasks[index], context),
                separatorBuilder: (context, index) => Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 20, end: 20),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                itemCount: tasks.length),
            fallback: (BuildContext context) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.menu,
                        size: 100,
                        color: Colors.grey,
                      ),
                      Text(
                        'No Tasks Yet, Please Add Some Tasks',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                ));
      },
    );
  }
}

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text('${model['time']}'),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateDatabase(status: 'done', id: model['id']);
                },
                icon: const Icon(
                  Icons.check_box,
                  color: Colors.grey,
                )),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateDatabase(status: 'archive', id: model['id']);
                },
                icon: const Icon(Icons.archive))
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDataBase(id: model['id']);
      },
    );
