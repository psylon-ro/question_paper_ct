import 'package:flutter/material.dart';
import 'package:question_paper_ct/Screens/question_paper.dart';
import 'package:question_paper_ct/components/clock.dart';
import 'package:question_paper_ct/components/constants.dart';
import 'package:question_paper_ct/components/dropdown.dart';

class Open extends StatelessWidget {
  static const String _title = 'Question Paper module';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 40, 10, 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Card(
                child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 30, right: 30, bottom: 30.0),
                      child: SizedBox(
                        width: 100,
                        child: Dropdown(
                          startname: 'I-A',
                          listt: classList,
                        ),
                      ),
                    ),
                    /* Padding(
                      padding: EdgeInsets.all(30.0),
                      child: FittedBox(
                        fit: BoxFit.contain, // otherwise the logo will be tiny
                        child: Dropdown(
                          startname: 'English',
                          listt: subjectList,
                        ),
                      ),
                    ), */
                    Timee(
                      buttonname: 'Start time',
                    ),
                    Timee(
                      buttonname: 'Stop time',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyForm()),
                              );
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                            label: Text('Create questions'),
                          ),
                        ],
                      ),
                    )
                  ]),
            ) // Navigate to second route when tapped.

                ),
          ),
        ),
      ),
    );
  }
}
