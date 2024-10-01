import 'package:atividade02/contaCorrente.dart';
import 'package:atividade02/contaPoupanca.dart';
import 'package:flutter/material.dart';

import 'contaBancaria.dart';

void main() {
  var contaCorrente =
      ContaBancaria<ContaCorrente>(ContaCorrente('123-456'), 1000.0);

  var contaPoupanca =
      ContaBancaria<ContaPoupanca>(ContaPoupanca('789-101'), 500.0);

  contaCorrente.depositar(200.0);
  contaCorrente.sacar(300.0);
  contaCorrente.transferir(
      100.0, contaPoupanca as ContaBancaria<ContaCorrente>);
}
