class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index 
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end

  def create
    @order = Order.new(
                      user_id: current_user.id,
                      product_id: params[:product_id],
                      quantity: params[:quantity],

                      )

    @order.build_totals    
    @order.save
    
    render 'show.json.jbuilder'
  end 

  def show
    @orders = Order.find(params[:id])
    render 'show.json.jbuilder'
  end

end
