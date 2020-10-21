class PedidosController < ApplicationController

        http_basic_authenticate_with name: "admin", password: "123", except: [:index, :show]

        def index
                @pedidos = Pedido.all
        end

        def show
                @pedido = Pedido.find(params[:id])
        end

        def new
                @pedido = Pedido.new
        end

        def edit
                @pedido = Pedido.find(params[:id])
        end

        def create
                #render plain: params[:pedido].inspect
                @pedido = Pedido.new(pedido_params)

                if @pedido.save
                        redirect_to @pedido
                else
                        render 'new'
                end
        end

        def update
                @pedido = Pedido.find(params[:id])
               
                if @pedido.update(pedido_params)
                  redirect_to @pedido
                else
                  render 'edit'
                end
        end

        def destroy
                @pedido = Pedido.find(params[:id])
                @pedido.destroy
             
                redirect_to pedidos_path
        end

        private 
                def pedido_params
                        params.require(:pedido).permit(:title, :text)
                end
end
