require 'pp'

class MyMenu

  attr_reader :menuitems

 
  def initialize
    @menuitems = Array.new
    @number = 1
  end
  
  def additemtolist(name, func)
    @menuitems << [@number, "#{name}", "#{func}"]
    @number += 1
  end
  
end

a = MyMenu.new
a.additemtolist("List Funcs", "listfuncs;")
a.additemtolist("List Funcs", "listfuncs;")
a.additemtolist("List Funcs", "listfuncs;")
a.additemtolist("List Funcs", "listfuncs;")
a.additemtolist("List Funcs", "listfuncs;")

pp a.menuitems
