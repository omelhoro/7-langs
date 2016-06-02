puts "Igor"

File.open('day1.rb') {|f| puts f.read}

f=File.open('day1.rb')
f.read

{1=>6,2=>12}.to_a

puts [[1,6],[2,12]].methods

puts [[1,6],[2,12]].to_ary

puts [[1,6],[2,12]].hash

{1=>6,2=>12}.each {|i,j| puts i+j}

a=(1..16).to_a
a.each_with_index do |i,j|
	if j%4==0 or j==0
		puts i,"#{a[j..(j+3)]}"
	end
end

a.each_slice(4) {|coll| puts "#{coll}"}

d={'grandpa' =>
 {'dad'=>
  {'child 1'=>{},
  'child 2' =>{}},
 'uncle' =>
 {'child 3' => {},
  'child 4' => {}}}}
class Tree
	attr_accessor :children,:node_name
	def initialize(struct)
		if struct.class==Hash
			@node_name= struct.keys[0] 
			@children = struct[@node_name].to_a.map {|coll| Tree.new(coll)} 
		else
			@node_name=struct[0]
			@children = struct[1].to_a.map {|coll| Tree.new(coll)}
		end
	end
	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end
	def visit(&block)
		block.call self
	end
end
Tree.new(d).visit_all {|t| puts t.node_name}

File.open('day1.rb') do |f|
	f.each_with_index {|l,j| puts "#{j}: #{l}" if l.scan('a')}
end
