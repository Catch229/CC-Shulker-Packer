inscriber = peripheral.wrap("top")

function emptyinv(final_slot)
	current_slot = 1
	while (current_slot <= final_slot) do
		turtle.select(current_slot)
		turtle.drop()
		current_slot = current_slot + 1
	end
end


while true do
	last_slot = nil
	slot_index = 1
	while turtle.getItemDetail(slot_index) do
		last_slot = turtle.getItemDetail(slot_index);
		slot_index = slot_index + 1
		print("1")
		sleep(0.5)
	end

	if last_slot then
		if string.find(last_slot["name"], "shulker") then
			print("found shulker")
			turtle.select(slot_index-1)
			turtle.place()
			emptyinv(slot_index-2)
			
			turtle.select(1)
			turtle.dig()
			inscriber.pullItems("down", slot_index, 1 , 1)
			inscriber.pullItems("down", 1, 1, 3)
			sleep(10)
			inscriber.pushItems("down", 4, 64, 16)
			while turtle.getItemDetail(16) do
				sleep(0.5)
				print("Waiting to return name press...")
			end
			inscriber.pushItems("down", 1, 64, 16)
			print("Package Complete")
		end
	end
	sleep(0.5)
end
