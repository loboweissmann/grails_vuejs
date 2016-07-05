package vendas

class ItemVenda {

  static belongsTo = [
    venda:Venda,
    produto:Produto
  ]

  static constraints = {
    venda nullable:false
    produto nullable:false, unique:['venda']
  }
}
