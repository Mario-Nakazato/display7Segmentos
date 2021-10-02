require "display7segmentos"

function love.load(arg)
  
    if arg[#arg] == "-debug" then require("mobdebug").start() end -- Debug para ZeroBrane Studio IDE Utilize; Argumento - arg esta disponivel global.
    
    tempo = 0

    algarismo = display.novo(64, 64)
  
end

function love.update(dt)

    tempo = tempo +dt

    algarismo:update(tempo)
  
end

function love.draw()

    algarismo:draw()
  
end

function love.keypressed(tecla, cod, repeticao)
    
    algarismo:digito(tecla)
  
end