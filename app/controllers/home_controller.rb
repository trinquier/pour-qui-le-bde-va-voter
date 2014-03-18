class HomeController < ApplicationController

  skip_filter :authenticate_admin!

  def index
    @items = Item.all
    @best_list = Item.best_list
  end

end
