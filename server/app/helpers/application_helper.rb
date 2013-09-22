module ApplicationHelper
  def star(number)
    ("<span>" +
    number.times {"<i class='icon-star icon-3'></i>"} +
    "</span>").html_safe
  end
end
