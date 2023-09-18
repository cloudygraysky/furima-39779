class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  #def edit
  #end

  #def destroy
  #end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :condition_id, :category_id, :delivery_date_id,
                                 :delivery_method_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
