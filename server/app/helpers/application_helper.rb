module ApplicationHelper
  def star(number)
    z=''
    (number.to_i).times do
      puts "done"
      z+="<i class='icon-star icon-3'></i>"
    end
    puts z
    ("<span>" + z +"</span>").html_safe
  end
end