module Api
    module V1
      class OrdersController < ApplicationController
        def index
          if params[:customer_id].nil?
            @orders = Order.all
          else
            @orders = Order.where(customer_id: params[:customer_id])
          end
          
          render json: @orders
        end
  
        def show
          @orders = Order.find(params[:id])
  
          render json: format_order(@orders)
        end
  
        def create
          @orders = Order.new(customer_id:params[:customer_id], status: :pending)
  
          if @orders.save
            render json: @orders, status: :created, location: api_v1_order_url(@orders)
          else
            render json: @orders.errors, status: :unprocessable_entity
          end
        end 

        def ship
            @order = Order.find(params[:id])
            if @order.status === "shipped"
                render json: {
                    message: "Your order has already been shipped",
                    order: @order
                }
            elsif @order.status.downcase === "pending"
                @order.update(status: :shipped) 
                render json: {
                    message: "Your order has departed",
                    order: @order
                }
            else
                render json: @order.errors, status: :unprocessable_entity
            end
        end

      end
    end
end