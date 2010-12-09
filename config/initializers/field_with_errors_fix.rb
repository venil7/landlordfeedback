#prevents from wrapping errord fields into an additional tag
ActionView::Base.field_error_proc = Proc.new { |html_tag, instance|
  html_tag
}
