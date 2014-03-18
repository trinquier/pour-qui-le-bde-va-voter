class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        Log.create admin: current_admin, item: @item, content: "Created with params: list=#{@item.list_name} ; points=#{@item.points} ; title=#{@item.title}"
        format.html { redirect_to items_url, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    old_item = @item
    respond_to do |format|
      if @item.update(item_params)
        Log.create admin: current_admin, item: @item, content: "Updated with params: list=#{@item.list_name} ; points=#{@item.points} ; title=#{@item.title}. Old params were: list=#{old_item.list_name} ; points=#{old_item.points} ; title=#{old_item.title}"
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      Log.create admin: current_admin, item: @item, content: "Destroyed. Old params were: list=#{@item.list_name} ; points=#{@item.points} ; title=#{@item.title}."
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :list, :points)
    end
end
