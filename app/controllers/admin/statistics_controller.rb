class Admin::StatisticsController < ApplicationController
  def index
    statisticbydate
    statisticbymonth
    statisticbyyear
  end

  private

  def statisticbydate
    @date = Order.count_date.count.keys
    @orderdate = Order.count_date.count.values
    @moneydate = Order.count_date.sum(:total_amount).values
  end

  def statisticbyyear
    @year = Order.count_year.count.keys
    @orderyear = Order.count_year.count.values
    @moneyyear = Order.count_year.sum(:total_amount).values
  end

  def statisticbymonth
    @month = Order.count_month.count.keys
    @ordermonth = Order.count_month.count.values
    @moneymonth = Order.count_month.sum(:total_amount).values
  end
end
