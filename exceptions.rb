def api_causing_exception
  raise "This is a supposed error"
end
some_factor = 1
different_factor = 'empty'
begin
  puts "some message"
  api_causing_exception unless some_factor == 2
  puts "this Message shouldn't appear"
rescue
  puts "Oops. An Error Occurred"
  some_factor = 2
  retry
else
  puts "the correct value for some_factor is #{some_factor}" unless some_factor == 1
ensure
  puts "Ensuring that this block always gets executed"
end

(1..10).each { |i|
  begin
    puts "This is the #{i}#{
      if i == 1
        'st'
      else
        i == 2 ? 'nd' : (i == 3 ? 'rd' : 'th')
      end} iteration"
    api_causing_exception unless different_factor != 'empty'
  rescue => error
    print error.message, "\nplease provide a valid value for different_factor: "
    different_factor = gets.chomp
    retry
  ensure
    puts "This ensure gets"



  end
}