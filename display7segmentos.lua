--[[

  Display 7 Segmentos

--]]

local lgrafico = love.graphics
local lmat = love.math

local rgbByte = lmat.colorFromBytes

local update = true

local digitos = {}
    digitos["nil"] = "0000000"
    digitos["0"] = "1111110"
    digitos["1"] = "0110000"
    digitos["2"] = "1101101"
    digitos["3"] = "1111001"
    digitos["4"] = "0110011"
    digitos["5"] = "1011011"
    digitos["6"] = "1011111"
    digitos["7"] = "1110000"
    digitos["8"] = "1111111"
    digitos["9"] = "1111011"

    digitos["kp0"] = "1111110"
    digitos["kp1"] = "0110000"
    digitos["kp2"] = "1101101"
    digitos["kp3"] = "1111001"
    digitos["kp4"] = "0110011"
    digitos["kp5"] = "1011011"
    digitos["kp6"] = "1011111"
    digitos["kp7"] = "1110000"
    digitos["kp8"] = "1111111"
    digitos["kp9"] = "1111011"

local function novo(x, y)
  
    local segmentos = {
        x = x,
        y = y,
        c = 128,
        l = 32,
        n = nil,
    }

    function segmentos:digito(n)
        if digitos[tostring(n)] ~= nil then
            update = false
            self.n = n
        else
            update = true
            self.n = nil
        end
    end

    function segmentos:update(dt)
        if update then
            self.n = self.n or 0
            self.n = math.floor(dt %10)
        end
    end

    function segmentos:cor(deslocar)
        lgrafico.setColor(rgbByte({255, 0, 0, 64 +255 *string.sub(digitos[tostring(self.n)], deslocar, deslocar)}))
    end

    function segmentos:draw()
        self:cor(1)
        lgrafico.rectangle("fill", self.x +self.l, self.y, self.c, self.l, 8)--A
        self:cor(2)
        lgrafico.rectangle("fill", self.x +self.c +self.l, self.y +32, self.l, self.c, 8)--B
        self:cor(3)
        lgrafico.rectangle("fill", self.x +self.c +self.l, self.y +self.c +32 *2, self.l, self.c, 8)--C
        self:cor(4)
        lgrafico.rectangle("fill", self.x +self.l, self.y +self.c *2 +32 *2, self.c, self.l, 8)--D
        self:cor(5)
        lgrafico.rectangle("fill", self.x, self.y +self.c +32 *2, self.l, self.c, 8)--E
        self:cor(6)
        lgrafico.rectangle("fill", self.x, self.y +32, self.l, self.c, 8)--F
        self:cor(7)
        lgrafico.rectangle("fill", self.x +self.l, self.y +self.c +self.l, self.c, self.l, 8)--G
    end

    return segmentos
  
  end
  
  display = {
    novo = novo
  }
  
  print("display7segmentos.lua")
  
  return display