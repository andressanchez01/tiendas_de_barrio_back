class ProductsController < ApplicationController

  before_action :authenticate_user!,:set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end
  def shop
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
    @cart = current_cart
  end

  def show_user
    @product = Product.find(params[:id])
    @cart = current_cart
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Producto creado exitosamente.'
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Producto actualizado exitosamente.'
    else
      render :edit
    end
  end
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Producto eliminado exitosamente.'
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:name,:description,:stock,:cost,:price,:rank,:idCategory,:idProduct,:image)
  end


end
