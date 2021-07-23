import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:question_paper_ct/components/theoptionsfiesld.dart';
import 'package:question_paper_ct/formatter.dart';

Format taker = Format();

enum option { option1, option2, option3, option4 }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic TextFormFields',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  option? correctOption = option.option1;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  List<String> optionsList = [''];
  late TextEditingController scoreText;
  List<String> questionlist = [];
  List<List> answerlist = [];
  List<int> scorekeep = [0, 0, 0, 0];
  List<dynamic> finallist = [];
  List<int> totalscorelist = [];
  int questionnumber = 1;
  int ind = 0;
  int counter = 1;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    scoreText = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    scoreText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              questionnumber > 1
                  ? SizedBox(
                      height: 50,
                      width: 150,
                      child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60.0))),
                          onPressed: () {
                            setState(() {
                              counter--;
                              questionnumber--;
                              dataget(counter);
                              updatedata(counter);
                            });
                          },
                          child: Text(
                            'Prev Question',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                          )),
                    )
                  : SizedBox(),
              SizedBox(
                height: 50,
                width: 150,
                child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60.0))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //_formKey.currentState!.save();

                        if (counter >= finallist.length) {
                          if (counter > finallist.length) {
                            totalscorelist.add(int.parse(scoreText.text));
                            scorekeep[ind] = int.parse(scoreText.text);
                            questionlist.add(_nameController.text);
                            answerlist.add(
                                taker.answerformatter(optionsList, scorekeep));
                            finallist =
                                taker.formatter(answerlist, questionlist);

                            print(finallist);
                          }

                          setState(() {
                            counter++;
                            questionnumber++;
                            _nameController.clear();
                            scorelogic(option.option1);
                            scoreText.clear();
                            if (optionsList.length > 1) {
                              optionsList.removeRange(1, optionsList.length);
                            }
                            optionsList[0] = '';
                          });
                        } else {
                          setState(() {
                            counter++;
                            questionnumber++;
                            dataget(counter);
                            updatedata(counter);
                          });
                        }
                      }
                    },
                    child: Text(
                      'Next Question',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    )),
              ),
            ]),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Question Format'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Your Question',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                // question textfield
                Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Q$questionnumber. ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              hintText: 'Enter your questiontext'),
                          validator: (v) {
                            if (v!.trim().isEmpty)
                              return 'Please enter the question';
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: scoreText,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4)
                          ],
                          keyboardType: TextInputType.number,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          decoration: InputDecoration(hintText: 'score'),
                          validator: (v) {
                            if (v!.trim().isEmpty) return 'score';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Add Options',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),

                ..._getOptions(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  /// get options text-fields
  List<Widget> _getOptions() {
    List<Widget> optionsTextFields = [];

    for (int i = 0; i < optionsList.length; i++) {
      optionsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Text(
              (i + 1).toString() + ')',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 5,
                child: FriendTextFields(
                  index: i,
                  optionslist: optionsList,
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Radio(
                  value: option.values[i],
                  groupValue: correctOption,
                  onChanged: (option? value) {
                    setState(() {
                      scorelogic(value);
                    });
                  }),
            ),
            buttonkeepers(i),
          ],
        ),
      ));
    }

    return optionsTextFields;
  }

//logic of adding the score
  scorelogic(option? value) {
    correctOption = value;
    if (scoreText.text.isNotEmpty) {
      if (correctOption == option.option1) {
        ind = 0;
        scorekeep[1] = scorekeep[2] = scorekeep[3] = 0;
      } else if (correctOption == option.option2) {
        ind = 1;
        scorekeep[0] = scorekeep[2] = scorekeep[3] = 0;
      } else if (correctOption == option.option3) {
        ind = 2;
        scorekeep[0] = scorekeep[1] = scorekeep[3] = 0;
      } else {
        ind = 3;
        scorekeep[0] = scorekeep[1] = scorekeep[2] = 0;
      }
    } else {
      scorekeep[0] = scorekeep[1] = scorekeep[2] = scorekeep[3] = 0;
    }
  }

  //logic of the add/remove to appear in the UI
  Widget buttonkeepers(int i) {
    if ((optionsList.length == 2) | (optionsList.length == 3)) {
      return Container(
        width: 65,
        child: Row(
          children: [
            addRemoveButton(
                (optionsList.length == 1) & (optionsList.length < 4), i),
            SizedBox(width: 4),
            addRemoveButton(
                (optionsList.length == 2) | (optionsList.length == 3), i)
          ],
        ),
      );
    } else {
      return Container(
        width: 65,
        alignment: optionsList.length == 1
            ? Alignment.bottomRight
            : Alignment.bottomLeft,
        child: addRemoveButton(
            (i == optionsList.length - 1) & (optionsList.length < 4), i),
      );
    }
  }

  /// add / remove button
  Widget addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the bottom of each textfield
          optionsList.insert(index + 1, '');
        } else
          optionsList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  dataget(int count) {
    optionsList.clear();
    _nameController.text =
        questionlist[count - 1]; //finallist[counter]["\"questionText\""];
    scoreText.text = totalscorelist[count - 1].toString();
    for (int i = 0; i < finallist[count - 1]["\"answers\""].length; i++) {
      if (i == 0) {
        optionsList.add(finallist[count - 1]["\"answers\""][0]["\"text\""]
            .replaceAll("\"", ""));
        if (finallist[count - 1]["\"answers\""][0]["\"score\""] > 0) {
          scorelogic(option.option1);
        }
      } else {
        optionsList.add(finallist[count - 1]["\"answers\""][i]["\"text\""]
            .replaceAll("\"", ""));
        switch (i) {
          case 1:
            if ((finallist[count - 1]["\"answers\""][1]["\"score\""] > 0)) {
              scorelogic(option.option2);
            }
            break;

          case 2:
            if ((finallist[count - 1]["\"answers\""][2]["\"score\""] > 0)) {
              scorelogic(option.option3);
            }
            break;

          case 3:
            if ((finallist[count - 1]["\"answers\""][3]["\"score\""] > 0)) {
              scorelogic(option.option4);
            }
            break;
        }
      }
    }
  }

  updatedata(int count) {
    print(count);
    print('---------');
    print(scoreText.text);
    print(totalscorelist[count - 1] = int.parse(scoreText.text));
  }
}

                           /*  totalscorelist.add(int.parse(scoreText.text));
                            scorekeep[ind] = int.parse(scoreText.text);
                            questionlist.add(_nameController.text);
                            answerlist.add(
                                taker.answerformatter(optionsList, scorekeep));
                            finallist =
                                taker.formatter(answerlist, questionlist);
                            print(finallist); */