import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'busines_logic/counter_cubit.dart';
import 'busines_logic/counterbloc_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterblocBloc>(
      create: (context) => CounterblocBloc(),
      //create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterblocBloc, CounterblocInitial>(
      //return BlocListener<CounterCubit, CounterInitial>(
      listener: (context, state) {
        if (state.wasIncremented == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('increment'),
              duration: Duration(microseconds: 300),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('decrement'),
              duration: Duration(microseconds: 300),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter_bloc'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterblocBloc, CounterblocInitial>(
                //BlocBuilder<CounterCubit, CounterInitial>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterblocBloc>().add(IncrementCounter());
                    // context.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterblocBloc>().add(DecrementCounter());
                    // context.read<CounterCubit>().decrement();
                  },
                  tooltip: 'decrement',
                  child: const Icon(Icons.remove),
                ),
              ]),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
