class CartsController < ApplicationController
  def show
    @cart = current_cart
    @total = calculate_cart_total(@cart)
    # Resto de la lógica de la acción
  end

  def add_to_cart
    @cart = current_cart
    product = Product.find(params[:product_id])
    if @cart.add_product(product)
      redirect_to cart_path, notice: "Producto agregado al carrito."
    else
      redirect_to product, alert: "No se pudo agregar el producto al carrito."
    end
  end

  def remove_from_cart
    @cart = current_cart
    if @cart_item = @cart.cart_items.find(params[:id])
      @cart_item.destroy
      redirect_to cart_path, notice: "Producto eliminado del carrito."
    else
      redirect_to cart_path, alert: "No se pudo eliminar el producto del carrito."
    end
  end
  def update_cart_item
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.update(cart_item_params) # Actualiza los atributos del elemento del carrito
      redirect_to cart_path(@cart), notice: 'Elemento del carrito actualizado exitosamente.'
    else
      render 'show' # Renderiza la vista de carrito si hay errores en la actualización
    end
  end
  private

  def current_cart
    if session[:cart_id]
      Cart.find(session[:cart_id])
    else
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end



  def calculate_cart_total(cart)
    total = 0
    cart.cart_items.each do |cart_item|
      total += cart_item.quantity * cart_item.product.price
    end
    total
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :other_attributes) # Define los atributos que se pueden actualizar
  end

end
