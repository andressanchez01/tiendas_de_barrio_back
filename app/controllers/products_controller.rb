class ProductsController < ApplicationController

  before_action :authenticate_user!,:set_product, only: [:show, :edit, :update, :destroy, :show_user]
  def index
    @products = Product.all
  end
  def shop
    @user = current_user
    current_page = params[:page] ||= 1
    @products = Product.populars.visible.paginate(page:current_page, per_page:10)
  end
  def show
    @cart = current_cart
  end

  def show_user
    @user = current_user
    @cart = current_cart
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Producto creado exitosamente.'}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
  end
  def update

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: 'Producto actualizado exitosamente.'}
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Producto eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def search
    @q = params[:q]
    @products = Product.where("name LIKE ?", "%#{@q}%").where(visible: true)
  end

  private
  def set_product
    #@product = Product.find(params[:id])
    @product = Product.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to product_url, notice: e.message
  end
  def product_params
    params.require(:product).permit(:name,:description,:stock,:cost,:price,:rank,:idProduct,:image,category_ids: [])
  end


end