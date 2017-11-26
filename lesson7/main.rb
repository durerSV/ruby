require_relative 'controller'

controller = Controller.new

begin 
  controller.main_menu
  action = gets.chomp.to_i
  controller.choise(action) 
end until action == 0