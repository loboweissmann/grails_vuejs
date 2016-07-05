package vendas

class Venda {

  BigDecimal valorTotal
  Date dataCadastro

  static belongsTo = [
    cliente:Cliente
  ]

  static hasMany = [
    itens:ItemVenda
  ]

  static constraints = {
    valorTotal nullable:false
    dataCadastro nullable:false
    cliente nullable:false
  }
}
