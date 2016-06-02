'Igor Fischer'.sub(/Fischer/, 'Melhor')

(1..10).first

'Hello, Ruby'.index('Ruby')

(1..10).each {puts 'Igor Fischer'}

(1..10).each {|i| puts "This is sentence number #{i}"}

name='Igor'
puts "My name is #{name}"


iuser=0
randrange=10
while iuser < randrange
      puts "Type a number (1-#{randrange})"
      iuser=gets.to_i
      icom=rand(randrange)
      puts "Your guess is #{iuser}, the right number is #{icom}"
      puts 'Right' if iuser== icom
end
