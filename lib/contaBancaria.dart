class ContaBancaria<T> {
  T numeroConta;
  double saldo;

  ContaBancaria(this.numeroConta, this.saldo);

  void depositar(double valor) {
    saldo += valor;
    print('Depósito de R\$ $valor realizado. Saldo atual: R\$ $saldo');
  }

  void sacar(double valor) {
    if (valor <= saldo) {
      saldo -= valor;
      print('Saque de R\$ $valor realizado. Saldo atual: R\$ $saldo');
    } else {
      print('Saldo insuficiente para realizar o saque de R\$ $valor');
    }
  }

  void transferir(double valor, ContaBancaria<T> destino) {
    if (valor <= saldo) {
      sacar(valor);
      destino.depositar(valor);
      print(
          'Transferência de R\$ $valor para a conta ${destino.numeroConta} realizada com sucesso.');
    } else {
      print('Saldo insuficiente para realizar a transferência de R\$ $valor');
    }
  }
}
