<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <style>
      .direita {
        text-align: right;
      }
    </style>
  </head>
  <body>

    <div id="mestre-detalhe" class="row">
      <h1>Cadastro de Pedidos</h1>
      <div class="row">
        <div class="medium-2 columns">Cliente</div>
        <div class="medium-10 columns">
          <select>
              <option v-for="c in clientes" value="{{c.id}}">{{c.nome}}</option>
          </select>
        </div>
      </div>



      <h2>Item</h2>
      <div class="row">
          <div class="medium-2 columns">
            C&oacute;digo: <input id="codigoProduto" type="text" v-model="item.produto.codigo" v-on:blur="buscarProduto()"/>
          </div>
          <div class="medium-4 columns">
            Nome:<br/>
            {{item.produto.nome}}
          </div>

          <div class="medium-2 columns">
            Valor unit&aacute;rio: <input type="text" v-model="item.produto.valor" disabled/>
          </div>
          <div class="medium-2 columns">
            Quantidade:    <input type="text" v-model="item.quantidade"/>&nbsp;
          </div>
          <div class="medium-2 columns text-right">
            <br/>
            <button class="button" :disabled="item.produto.id < 1" v-on:click="incluirItem()">Incluir</button>
          </div>
      </div>

      <h2>Detalhamento</h2>
      <table>
        <thead>
          <tr>
            <th>C&oacute;digo</th>
            <th>Nome</th>
            <th class="text-right">Valor unit&aacute;rio</th>
            <th class="text-right">Quantidade</th>
            <th class="text-right">Valor total</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in pedido.itens">
            <td>{{item.produto.codigo}}</td>
            <td>{{item.produto.nome}}</td>
            <td class="text-right">{{item.produto.valor | currency 'R$ '}}</td>
            <td class="text-right">{{item.quantidade}}</td>
            <td class="text-right">{{item.valor | currency 'R$ '}}</td>
            <td class="text-right"><button class="button warning" v-on:click="removerItem(item.produto.id)">Remover</button></td>
          </tr>
          <tr style="text-align:right; font-weight: bold;">
            <td colspan="5" class="direita">
              Total:
            </td>
            <td class="direita">{{pedido.valor | currency 'R$ '}}</td>
          </tr>
        </tbody>
      </table>


    </div>

    <asset:javascript src="pedido.js"/>
  </body>
</html>
