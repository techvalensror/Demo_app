class HomeController < ApplicationController
  def index
    
  end
  
  def create
    
  end

  private

  def fact_params
    params.require(:fact).permit(:id ,:title, :content, :author,:fact_image)
  end
end
