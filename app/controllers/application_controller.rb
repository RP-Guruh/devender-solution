class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  include Pagy::Method
  layout :layout_by_resource

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def layout_by_resource
    if devise_controller?
      "auth"
    else
      "application"
    end
  end
end
