class ItemsController < ApplicationController

    http_basic_authenticate_with name: "admin", password: "123", only: :destroy

    def create
        @pedido = Pedido.find(params[:pedido_id])
        @item = @pedido.items.create(item_params)
        redirect_to pedido_path(@pedido)
      end

      def destroy
        @pedido = Pedido.find(params[:pedido_id])
        @item = @pedido.items.find(params[:id])
        @item.destroy
        redirect_to pedido_path(@pedido)
      end
     
      private
        def item_params
          params.require(:item).permit(:item, :descricao)
        end

end
