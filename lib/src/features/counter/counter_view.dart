import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_value_notifier/src/features/counter/counter_notifier.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Counter'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${context.watch<CounterNotifier>().value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('increment'),
            child: const Icon(Icons.add_outlined),
            onPressed: () {
              context.read<CounterNotifier>().increment();
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('decrement'),
            child: const Icon(Icons.remove_outlined),
            onPressed: () {
              context.read<CounterNotifier>().decrement();
            },
          ),
        ],
      ),
    );
  }
}
