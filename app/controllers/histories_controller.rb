class HistoriesController < ApplicationController
  def show
    @order_details = OrderDetail.find_order params[:id]
  end
end
