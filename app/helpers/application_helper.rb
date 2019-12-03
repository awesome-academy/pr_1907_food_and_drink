module ApplicationHelper
  # Returns the full title on a per-page basics
  def full_title page_title = ""
    base_title = "Restaurant"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
