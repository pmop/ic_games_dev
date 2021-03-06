snake_body = {}


sn_x = 32
sn_y = 32
size = 0
x = {}
y = {}

width = 480
height = 480

p_x = 300
p_y = 400

cima = 0
baixo = 0
direita = 0
esquerda = 0

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end

function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end


function love.load()
	love.window.setTitle("Snake v1.0")
	snake_body[0] = love.graphics.newImage('sn.png')
	 
	
	point = love.graphics.newImage('point.png')
	love.window.setMode( width, height )
end



function love.draw()
	love.graphics.draw(snake_body[0], sn_x, sn_y)
	love.graphics.draw(point, p_x, p_y)
end

function love.keypressed(k)
    if k == 'escape' then
        love.event.quit()
    end

	if k == "up" and baixo ~= 1 then
		cima = 1
		baixo = 0
		direita = 0
		esquerda = 0
	elseif k == "down" and cima ~= 1 then
		cima = 0
		baixo = 1
		direita = 0
		esquerda = 0
	elseif k == "left" and direita ~= 1 then
		cima = 0
		baixo = 0
		direita = 0
		esquerda = 1
	elseif k == "right" and esquerda ~= 1 then
		cima = 0
		baixo = 0
		direita = 1
		esquerda = 0
	end
end

function love.update(dt)
	
	if cima == 1 and sn_y > 0 then	
		sn_y = sn_y - 16
	elseif baixo == 1 and sn_y < height - 16 then
		sn_y = sn_y + 16
	elseif esquerda == 1 and sn_x > 0 then		
		sn_x = sn_x - 16
	elseif direita == 1 and sn_x < width - 16 then
		sn_x = sn_x + 16
	end
	sleep(0.2)
	--print("x0 " .. x[0] .. " y0" .. y[0])

	if(checkCollision(sn_x, sn_y, 16, 16, p_x, p_y, 16, 16)) then
		p_x = math.random(0, width -16)
		p_y = math.random(0, height - 16)
	end
end


