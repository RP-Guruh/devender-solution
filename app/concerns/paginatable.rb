module Paginatable
  extend ActiveSupport::Concern

  included do
    helper_method :current_page, :per_page, :total_pages, :total_count
  end

  def total_count
    @total_count
  end

  def paginate(scope, per_page: 10)
  
    @per_page = per_page
    @current_page = params[:page]&.to_i || 1
    @current_page = 1 if @current_page <= 0

    @total_count = scope.count
    @total_pages = (@total_count / @per_page.to_f).ceil

    scope.offset((@current_page - 1) * @per_page).limit(@per_page)
  end

  def current_page
    @current_page
  end

  def per_page
    @per_page
  end

  def total_pages
    @total_pages
  end
end