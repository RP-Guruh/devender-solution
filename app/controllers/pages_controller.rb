class PagesController < ApplicationController
  def home
    @settings = Setting::pluck(:key, :value).to_h
  end

  def services
  end

  def work
  end

  def methodology
  end

  def about
  end

  def project_detail
  end
end
