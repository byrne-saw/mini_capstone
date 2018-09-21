class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index 
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end

  def create

      carted_products = current_user.cart
      @order = Order.new(user_id: current_user.id)
      # carted_products = current_user.carted_products.where(status: "carted")
      @order.calculate_subtotal(carted_products) 

      tax = subtotal * 0.09
      total = subtotal + tax

      @order.subtotal = subtotal
      @order.tax = @order.subtotal * 0.09
      @order.total = @order.subtotal + @order.tax

      @order.save
      # p @order.errors.full_messages

      carted_products.update_all(status: "purchased", order_id: @order.id)

      render 'show.json.jbuilder'
  end 

  def show
    @orders = Order.find(params[:id])
    render 'show.json.jbuilder'
  end

end
