require File.expand_path(File.join(
          File.dirname(__FILE__),
          "../lib/mymenu.rb"))

class FileServices

  def initialize
    @fdata = String.new
  end
  
  def writefile
    File.open("/tmp/mymenu.txt", 'w') {|n|
      n.puts("line 1")
      n.puts("line 2")
      n.puts("line 3")
    }
  end
  
  def openfile
    File.open("/tmp/mymenu.txt", 'r') {|n|
      n.each_line {|l|
        @fdata << l
      }
    }
    return @fdata
  end
  
end

x = MyMenu.new
#x.debug = 3
x.settitle("Welcome to Trafviz")
x.mymenuname = "Trafviz"
x.prompt = "Trafviz"
# Add my methods
x.definemenuitem("listfilters") do
  puts "My Filters"
  a = FileServices.new
  a.writefile
  data = a.openfile
  puts "#{data}"
end
# Define dummy method and create another instance of the class inside it.
x.definemenuitem("setfilters") do
  # My Set filters block
  y = MyMenu.new
  #y.debug = 3
  y.prompt = "Trafiz {Filters}>"
  retval = y.definemenuitem("setfilter", true) do |n|
    #instance_variables
    puts "Hello"
    a = 2
    if a == 1
      puts "My Test"
    else
      b = 1
      puts "B: #{b}"
    end
  end
  puts "Retval: #{retval}"
  # Execute function you just created
  retval2 = y.setfilter
  puts "Retval2: #{retval2}"
end
# Define your list items
x.additemtolist("List Filters", "listfilters;")
x.additemtolist("Set Filters", "setfilters;")
x.additemtolist("Display Menu", "showmenu;")
x.additemtolist("Toggle Menu", "togglemenu;")
x.additemtolist("Exit Trafviz", "exit;")
x.menu!
