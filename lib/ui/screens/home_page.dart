import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder/bloc/age_guess_bloc.dart';
import 'package:jsonplaceholder/bloc/age_guess_event.dart';
import 'package:jsonplaceholder/bloc/age_guess_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Age Guess Api"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                BlocProvider.of<AgeGuessBloc>(context).add(GuessMyAge(value));
              },
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  child: const Icon(Icons.search),
                  onTap: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<AgeGuessBloc, AgeGuessState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Failure) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is Empty) {
                    return const Center(
                      child: Text("Please Enter Your Name"),
                    );
                  }
                  return Column(
                    children: [
                      Text(
                        '${(state as Loaded).user.name} You Age Guess is : ',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text((state.user.age),
                          style: const TextStyle(
                              fontSize: 280, fontWeight: FontWeight.bold)),
                      const Text("Years Old", style: TextStyle(fontSize: 20))
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
