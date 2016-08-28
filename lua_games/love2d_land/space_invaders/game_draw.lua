function shoot()

end

function game_draw()
    if lost_flag then
        show_lost()
    elseif paused_flag then
        show_pause()
    end
    -- love.graphics.draw(border, 0, 0)
    local count_x = 110
    local count_y = 120

    for i = 1, 11 do
        animator_list['en_3']:draw(enemies, count_x, count_y)
        count_x = count_x + 50
    end
    count_x = 110
    count_y = count_y + 40

    for a = 1, 2 do
        for i = 1, 11 do
            animator_list['en_2']:draw(enemies, count_x, count_y)
            count_x = count_x + 50
        end
        count_x = 110
        count_y = count_y + 40
    end

    for a = 1, 2 do
        for i = 1, 11 do
            animator_list['en_1']:draw(enemies, count_x, count_y)
            count_x = count_x + 50
        end
        count_x = 110
        count_y = count_y + 40
    end

    -- print("p_x * size_xy / 2", p_x * size_xy / 2)
    -- print("p_y * size_xy ", p_y * size_xy)
    animator_list['cannon']:draw(enemies, p_x * size_xy / 2, p_y * size_xy);

    if orientation['shot'] then love.graphics.print('Shoting', 200, 0)
    else love.graphics.print('         ', 200, 0) end
    love.graphics.setFont(score_font)
    love.graphics.print(score, 10, 0)

    if orientation['shot'] then shoot() end
end


