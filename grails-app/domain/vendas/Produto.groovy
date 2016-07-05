package vendas

class Produto {

  String nome
  String codigo
  BigDecimal valor // valor unitario do item

  static constraints = {
    nome nullable:false, blank:false, maxSize:128
    codigo nullable:false, blank:false, maxSize:32, unique:true
  }
}
