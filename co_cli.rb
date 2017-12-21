require 'require_all'
require_all 'lib'

pricing_rules = Rules.new
co = Checkout.new(pricing_rules)

def help
  puts "Cabify's checkout process
  Options
    l - To list available products
    o - To check the state of your order
    s - To scan products (q to exit from submenu)
    t - To get the total of your order
    h - To list app options\n"
end

help
option = 'i'
while option != 'q'
  print '> '
  option = gets.chomp.to_s
  case option
  when 'l'
    co.list_products
  when 'o'
    co.list_order_items
  when 's'
    puts 'Enter each code follow by enter:'
    code = ''
    while code != 'q'
      print '>>'
      code = gets.chomp.to_s
      puts co.scan(code) if code.length > 1
    end
    option = 'i'
  when 't'
    puts "#{co.show_discount}the total to pay for your items is #{co.total}€"
  when 'q'
    puts 'See you soon'
  when 'h'
    help
  end
end
