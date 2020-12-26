s,front_item = turtle.inspect()
s,top_item = turtle.inspectUp()
if (front_item.name ~= "minecraft:chest") then
	error('missing chest in front')
end
if (top_item.name ~= "minecraft:chest") then
	error('missing chest on top')
end

while (true) do

	local slotnum = 1
	while slotnum < 12 do
		print('clearing slot ' .. slotnum)
		turtle.select(slotnum)
		turtle.drop();
		
		-- grab stuff to 3x3 in inventory
		if slotnum % 4 ~= 0 then
			print('attempt to suck to slot ' .. slotnum)
			full_stack = false
			repeat
				turtle.drop()
				non_empty = turtle.suck()
				item_count = turtle.getItemCount()
				full_stack = non_empty and item_count == 64
				if not full_stack then
					print('front chest lacking full stack, sleep 3 sec to try again')
					os.sleep(3)
				end
			end
		end
		slotnum = slotnum + 1
	end
	
	-- craft and deposit to chest on top
	turtle.craft()
	while not turtle.dropUp() do
		print('[!] upper chest is full, sleep 3 sec to try again')
		os.sleep(3)
	end
end
	
