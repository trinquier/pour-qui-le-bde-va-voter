class LogsController < ApplicationController

  def index
    @logs = Log.limit(100)
  end

end
