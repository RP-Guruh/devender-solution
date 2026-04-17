module PaginationHelper
  def render_pagination(frame_id: "results")
    render partial: "shared/pagination", locals: { frame_id: frame_id }
  end
end