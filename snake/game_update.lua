function game_update() 
	if orientation['up'] then	
		sn_y = sn_y - 16
	elseif orientation['down'] then
		sn_y = sn_y + 16
	elseif orientation['left'] then		
		sn_x = sn_x - 16
	elseif orientation['right'] then
		sn_x = sn_x + 16
	end

    if sn_x < 1 then
        sn_x = width - 16
    elseif sn_x > width - 31 then
        sn_x = 0 
    end

    if sn_y < 1 then
        sn_y = height - 31
    elseif sn_y > height - 17 then
        sn_y = 0 
    end


	sleep(0.2)
	--print("x0 " .. x[0] .. " y0" .. y[0])

	if(checkCollision(sn_x, sn_y, 16, 16, p_x, p_y, 16, 16)) then
		p_x = math.random(0, width -16)
		p_y = math.random(0, height - 16)
	end
end


