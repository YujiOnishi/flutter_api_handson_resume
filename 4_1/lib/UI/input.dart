import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../entity/HouseholdAccountData.dart';
import '../http/HouseholdAccountDataHttp.dart';

enum RadioValue { SPENDING, INCOME }

class InputFormState extends StateNotifier<RadioValue> {
  InputFormState() : super(RadioValue.INCOME);

  void changeState(value) {
    this.state = value;
  }
}

final inputFormProvider = StateNotifierProvider<InputFormState, RadioValue>((refs) => InputFormState());

class InputForm extends HookWidget {
  InputForm();
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => InputForm(),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  HouseholdAccountData _data = HouseholdAccountData(0, 0, "", 0);
  BuildContext _context;
  RadioValue _groupValue;

  @override
  Widget build(BuildContext context) {
    this._groupValue = useProvider(inputFormProvider);
    this._context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('家計簿登録'),
      ),
      body: SafeArea(
        child: Text("Form"),
      ),
    );
  }
  
  
}
