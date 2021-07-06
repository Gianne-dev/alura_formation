import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Exemplo de contador utilizando Bloc
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class CounterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Counter')),
        body: Center(child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(
              '$state',
              style: TextStyle(fontSize: 20),
            );
          },
        )),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => context.read<CounterCubit>().increment(),
              ),
              SizedBox(height: 8),
              FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () => context.read<CounterCubit>().decrement(),
              ),
            ]));
  }
}
