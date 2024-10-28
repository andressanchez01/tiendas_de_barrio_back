class CommentsController < ApplicationController
  before_action :set_product, only: [:create, :destroy]
  def create
    @product.comments.new(comment_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Comentario creado exitosamente.'}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to product_url(@product), status: :unprocessable_entity }
        format.json { render json: @product.comments.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private

  def set_product
    @product = Product.find_by slug:(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end