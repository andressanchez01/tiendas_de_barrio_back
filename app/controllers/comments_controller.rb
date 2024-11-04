class CommentsController < ApplicationController
  before_action :set_product, only: [:create, :destroy]
  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to product_url(@product), notice: 'Comentario creado exitosamente.'}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to product_url(@product), status: :unprocessable_entity }
        format.json { render json: @comment.comments.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @product.comments.find(params[:id])

    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to product_url(@product), notice: 'Comentario eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { redirect_to product_url(@product), alert: 'Error al eliminar el comentario.', status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product
    @product = Product.find_by slug:(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end