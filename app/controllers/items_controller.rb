class ItemsController < ApplicationController
  before_action :set_depart
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = @depart.items
  end

  def show
  end

  def new
    @item = @depart.items.new # bc it has_many relationship
  end

  def edit
  end

  def create
    @item = @depart.items.new(item_p)

    if @item.save
      redirect_to department_item_path(@depart, @item)
    else
      render :new
    end
  end

  def update
    if @item.update(item_p)
      redirect_to department_item_path(@depart, @item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to department_items_path
  end

  private
    def set_depart
      @depart = Department.find(params[:department_id])
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_p
      params.require(:item).permit(:name, :price, :desc)
    end

end
