import 'package:atividade02/contaBancaria.dart';
import 'package:atividade02/contaCorrente.dart';
import 'package:atividade02/contaPoupanca.dart';
import 'package:test/test.dart';

void main() {
  group('ContaBancaria', () {
    test('Deve depositar corretamente na conta', () {
      var conta =
          ContaBancaria<ContaCorrente>(ContaCorrente('123-456'), 1000.0);
      conta.depositar(200.0);
      expect(conta.saldo, equals(1200.0));
    });

    test('Deve sacar corretamente da conta', () {
      var conta =
          ContaBancaria<ContaCorrente>(ContaCorrente('123-456'), 1000.0);
      conta.sacar(300.0);
      expect(conta.saldo, equals(700.0));
    });

    test('Deve transferir corretamente entre contas', () {
      var contaCorrente =
          ContaBancaria<ContaPoupanca>(ContaPoupanca('123-456'), 1000.0);
      var contaPoupanca =
          ContaBancaria<ContaPoupanca>(ContaPoupanca('789-101'), 500.0);
      contaCorrente.transferir(100.0, contaPoupanca);
      expect(contaCorrente.saldo, equals(900.0));
      expect(contaPoupanca.saldo, equals(600.0));
    });

    test('Não deve permitir saque se saldo for insuficiente', () {
      var conta = ContaBancaria<ContaCorrente>(ContaCorrente('123-456'), 100.0);
      conta.sacar(300.0);
      expect(conta.saldo, equals(100.0));
    });
  });
}
