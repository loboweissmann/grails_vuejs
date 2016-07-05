//= require vue.min.js
//= require vue-resource.min.js
//= require_self

document.addEventListener('DOMContentLoaded', function () {
  var data = {
    pedido:{
      valor:0,
      itens:[]
    },
    item:{
        produto:{nome:"???", id:-1, codigo:''},
    }
  };

  new Vue({
    el:"#mestre-detalhe",
    data:data,
    methods:{
        buscarProduto:function() {
          var codigoProduto = this.$get('item').produto.codigo;
          this.$http.get('/pedido/produto', {params:{codigo:codigoProduto}}).then(
            (response) => {
              this.$set('item.produto', response.json());
            },
            (response) => {
              if (response.status == 404) {
                  this.$set('item.produto', {nome:'???', id:-1})
                  document.getElementById('codigoProduto').focus();
              }

            }
          )
        },
        incluirItem:function() {
          var item = this.$get('item');
          item.valor = item.quantidade * item.produto.valor
          var pedido = this.$get('pedido');
          pedido.itens.push(item);
          var valorTotal = 0;
          for (i = 0; i < pedido.itens.length; i++) {
              valorTotal += pedido.itens[i].valor;
          }
          pedido.valor = valorTotal;
          this.$set('pedido', pedido);
          this.$set('item', {quantidade:0, produto:{id:-1, codigo:'', nome:'???'}});
          document.getElementById('codigoProduto').focus();
        },
        removerItem:function(idProduto) {
          var pedido = this.$get('pedido');
          for (i = 0; i < pedido.itens.length; i++) {
            if (pedido.itens[i].produto.id == idProduto) {
              pedido.itens.splice(i, 1);
              break;
            }
          }
          var valorTotal = 0;
          for (i = 0; i < pedido.itens.length; i++) {
              valorTotal += pedido.itens[i].valor;
          }
          pedido.valor = valorTotal;
          this.$set('pedido', pedido);
        }
    }
    ,
    ready() {
      // O que executar quando a instancia do Vue.js iniciar

      this.$http.get('/pedido/create').then((response) => {
        // sucesso
        this.$set('clientes', response.json().clientes)
      }, (response) => {
        // falha
        alert("Erro!")
      })

    }// fim de ready()
  });

});
