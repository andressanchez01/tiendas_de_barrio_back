class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items.includes(:product)
  end

  def new
    @order = current_user.orders.build(user_id:current_user.id, customer_name: current_user.name, address: current_user.address, phone: current_user.phone )
    @cart_items = current_user.cart.cart_items.includes(:product)
    @total = @cart_items.sum { |cart_item| cart_item.quantity * cart_item.product.price }
  end

  def create
    @order = current_user.orders.build(user_id:current_user.id, customer_name: current_user.name, address: current_user.address, phone: current_user.phone )
    @order.cart = current_user.cart
    @cart_items = current_user.cart.cart_items.includes(:product)
    @order.status = 'pending'
    cart_total = current_user.cart.cart_items.sum { |cart_item| cart_item.quantity * cart_item.product.price }
    @order.total_amount = cart_total
    if @order.save
      current_user.cart.cart_items.each do |cart_item|
        order_item = @order.order_items.create(product: cart_item.product, quantity: cart_item.quantity, price: cart_item.product.price)
        order_item.calculate_total
        order_item.save
      end
      current_user.cart.cart_items.destroy_all
      redirect_to @order, notice: 'La orden se creó exitosamente.'
    else
      Rails.logger.error("Error al crear la orden: #{@order.errors.full_messages}")
      render :new
    end
  end

  def all_orders
    @orders = Order.all
  end

  def update_status
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order, notice: 'El estado de la orden ha sido actualizado.'
    else
      render :show
    end
  end
  private

  def order_params
    params.require(:order).permit(:customer_name, :address, :phone, :status)
  end
end
