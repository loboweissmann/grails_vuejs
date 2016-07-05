package vendas

class PedidoController {

    def create() {
      render(contentType:'application/json') {
        [clientes:Cliente.list().collect({[id:it.id, nome:it.nome]})]
      }
    }

    def index() {
      
    }

    def produto(String codigo) {
      def produto = Produto.findByCodigo(codigo)
      def resultado = null
      if (produto) {
        resultado = [id:produto.id, nome:produto.nome, codigo:produto.codigo, valor:produto.valor]
        response.status = 200
      } else {
        response.status = 404
        resultado = [msg:"Produto com código ${codigo} não encontrado"]
      }
      render(contentType:"application/json") {
        resultado
      }
    }



}
