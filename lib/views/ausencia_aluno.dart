import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AusenciaAluno {
  final _formKey = GlobalKey<FormState>();

  save(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      //_formKey.currentState.save();
    }
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  Future ausencia(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text("Seu filho irá faltar:"),
          content: Container(
            child: Form(
              key: _formKey,
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: "Data",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
                //onSaved: (value) => login = value,
                validator: (value) =>
                    value.isEmpty ? "Campo obrigatório" : null,
                /*final data = value.split("/");
                    if (data.length == 3) {
                      final day = int.tryParse(data[0]);
                      final month = int.tryParse(data[1]);
                      final year = int.tryParse(data[2]);
                      if (day != null && month != null && year != null) {
                        final date = DateTime(year, month, day);
                      }
                    } else {
                      value = "Data Incorreta";
                    }*/
                inputFormatters: [maskFormatter],
              ),
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "CANCELAR",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FlatButton(
              onPressed: () async {
                save(context);
              },
              child: Text(
                "SIM",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
