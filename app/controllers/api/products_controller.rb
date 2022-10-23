class Api::ProductsController < ApplicationController
    def index
        @products = Product.all
        render :index
    end

    def show
        @product = Product.find(params[:id])
        render :show
    end

    def create
        @product = Product.new(product_params)
        if @product.save
          render :show
        else
          render json: @product.errors.full_messages, status: 401
        end
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            render :show
        else
            render json: @product.errors.full_messages, status: 401
        end
    end

    def destroy
        @product = Product.find(params[:id])
        if @product
            @product.destroy
            render :show
        else
            render ['Could not find product']
        end
    end

    private
    def product_params
        params.require(:chirp).permit(:title, :description, :price, :picture_url)
    end
end
