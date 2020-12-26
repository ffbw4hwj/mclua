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
	while slotnum < 15 do
		print('attempt to suck to slot ' .. slotnum)		
		turtle.drop(slotnum);
		
		-- grab stuff to 3x3 in inventory
		if slotnum % 4 ~= 0 then
			turtle.select(slotnum)
			while not turtle.suck() do
				print('[!] front chest is empty, sleep 3 sec to try again')
				os.sleep(3)
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
	
