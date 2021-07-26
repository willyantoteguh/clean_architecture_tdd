import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final textEditingController = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Input a Number'),
        onChanged: (value) {
          inputStr = value;
        },
        onSubmitted: (_) {
          dispatchCOncrete();
        },
      ),
      // Placeholder(fallbackHeight: 40),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Expanded(
            // child: Placeholder(
            //   fallbackHeight: 30,
            // ),
            child: RaisedButton(
              onPressed: dispatchCOncrete,
              child: Text('Search'),
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            // child: Placeholder(
            //   fallbackHeight: 30,
            // ),
            child: RaisedButton(
              onPressed: dispatchRandom,
              child: Text('Get Random Trivia'),
            ),
          )
        ],
      )
    ]);
  }

  void dispatchCOncrete() {
    textEditingController.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .dispatch(GetTriviaForConcreteNumber(inputStr));
  }

  void dispatchRandom() {
    textEditingController.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .dispatch(GetTriviaForRandomNumber());
  }
}
