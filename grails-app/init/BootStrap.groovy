import vendas.*


class BootStrap {

    def init = { servletContext ->
      def produtos = [
        [codigo:"1234", nome:"Caneta", valor:2.6],
        [codigo:"1235", nome:"Borracha", valor:5],
        [codigo:"1236", nome:"Lápis", valor:1]
      ]

      for (produto in produtos) {
        new Produto(produto).save(failOnError:true)
      }

      def clientes = ["Chiquinha", "Fraude", "Zé"]
      for (cliente in clientes) {
        new Cliente(nome:cliente).save(failOnError:true)
      }

    }
    def destroy = {
    }
}
