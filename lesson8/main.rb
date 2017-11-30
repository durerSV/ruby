require_relative 'controller'

controller = Controller.new

loop do
  controller.main_menu
  action = gets.chomp.to_i
  controller.choise(action)
  break if action.sero?
end
