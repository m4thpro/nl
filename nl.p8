pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- number lunchers
-- by kisonecat

pl = {}
pl.x = 16
pl.y = 16
pl.dx = 0
pl.dy = 0
pl.left = false

-- game stats
score = 17
level = 1
lives = 3
title = "squares modulo 8"

-- position of board
cx = 6
cy = 5
originx = 16
originy = 24

function eat(number)
   score = score + 1
end

function draw_troggle(t)
   local bottom = 16

   if t.dx == 0 and t.dy == 0 then
      bottom = 16
   else
      if (t.x + t.y) % 4 == 2 then
	 bottom = 2
      end
      if (t.x + t.y) % 4 == 0 then
	 bottom = 18
      end
   end
   
   pal(8,0)
   if t.down then
      spr(36, t.x, t.y, 2, 1)
      spr(bottom + 36, t.x, t.y + 8, 2, 1)
      return
   end

   if t.up then
      spr(40, t.x, t.y, 2, 1) 
      spr(bottom + 40, t.x, t.y + 8, 2, 1)
      return
   end

   spr(32, t.x, t.y, 2, 1, t.left)      
   spr(bottom + 32, t.x, t.y + 8, 2, 1, t.left)
end

function move_troggle(t)
   t.x = t.x + t.dx
   t.y = t.y + t.dy

   -- stay pointing in movement direction
   if t.dx < 0 then
      t.left = true
      t.up = false
      t.down = false
   end
   if t.dx > 0 then
      t.left = false
      t.up = false
      t.down = false      
   end
   if t.dy < 0 then
      t.left = false      
      t.up = true
      t.down = false
   end
   if t.dy > 0 then
      t.left = false      
      t.up = false
      t.down = true
   end

   -- stop when we make it to a square
   if (t.x - originx) % 16 == 0 then
      t.dx = 0
   end
   if (t.y - originy) % 16 == 0 then
      t.dy = 0
   end

   -- if we are not moving, then wait a random time
   if t.dx == 0 and t.dy == 0 and not t.waiting then
      t.waiting = rnd() * 32
   end

   if t.waiting then
      t.waiting = t.waiting - 1

      -- once we're done waiting...
      if t.waiting < 0 then
	 t.waiting = nil
	 -- move in a random direction
	 local r = flr(4*rnd())
	 if r == 0 then t.dx =  1 end
	 if r == 1 then t.dx = -1 end
	 if r == 2 then t.dy =  1 end
	 if r == 3 then t.dy = -1 end	 
      end
   end

   -- troggles die when off the screen
   if t.x == originx - 16 then t.dead = true end
   if t.y == originy - 16then t.dead = true end
   if t.x == originx + 16*cx then t.dead = true end
   if t.y == originy + 16*cy then t.dead = true end

   if t.dead then
      del(troggles,t)
   end
end

function make_troggle(x,y)
   local t = {}
   t.x = x
   t.y = y
   t.dx = 0
   t.dy = 0
   add(troggles,t)
   return t
end

function _init()
   troggles = {}
   board = {}
   make_troggle(3*16 + originx,2*16 + originy)
   for i=1,cx do
      board[i] = {}
      for j=1,cy do
	 board[i][j] = i+j
	 if i==j then
	    board[i][j] = false
	 end
      end      
   end
end

function print_center(str,y,col)
   local width = 4 * #str
   local x = 64 - 2 * #str
   print(str, x, y, col)   
end

function draw_title()
   local width = 4 * #title
   local x = 64 - 2 * #title
   line(x, 8, x + width - 2, 8, 9 )
   line(x, 16, x + width - 2, 16, 9 )   
   print_center(title, 10, 7)
end

function draw_board()
   for i=1,cx do
      for j=1,cy do
	 if board[i][j] != false then
	    local text = tostr(board[i][j])
	    local width = 4 * #text - 2
	    print(tostr(board[i][j]),(i-1)*16 + originx + 8 - width/2,(j-1)*16 + originy + 6, 6)
	 end
      end      
   end
end

function draw_player()
   local bottom
   
   if pl.dx == 0 and pl.dy == 0 then
      bottom = 16
   else
      if (pl.x + pl.y) % 4 == 2 then
	 bottom = 18
      end
      if (pl.x + pl.y) % 4 == 0 then
	 bottom = 2
      end
   end
   
   pal(8,0)
   if pl.mouth_open then
      spr(4, pl.x, pl.y, 2, 1, pl.left)
      spr(bottom + 4, pl.x, pl.y + 8, 2, 1, pl.left)
   else
      spr(0, pl.x, pl.y, 2, 1, pl.left)      
      spr(bottom, pl.x, pl.y + 8, 2, 1, pl.left)
   end 
end

function _update()
   foreach(troggles, move_troggle)
   
   if (btn(0)) then pl.dx=-1 end
   if (btn(1)) then pl.dx= 1 end
   if (btn(2)) then pl.dy=-1 end
   if (btn(3)) then pl.dy= 1 end
   
   -- Move in the desired direction
   pl.x = pl.x + 2*pl.dx
   pl.y = pl.y + 2*pl.dy
   
   -- Do not walk off the screen
   if pl.x < originx then pl.x = originx end
   if pl.y < originy then pl.y = originy end
   if pl.x > originx + 16*(cx-1) then pl.x = originx + 16*(cx-1) end
   if pl.y > originy + 16*(cy-1) then pl.y = originy + 16*(cy-1) end  
   
   -- stay pointing in movement direction
   if pl.dx < 0 then
      pl.left = true
   end
   if pl.dx > 0 then
      pl.left = false
   end
   
   -- stop when we make it to a square
   if (pl.x - originx) % 16 == 0 then
      pl.dx = 0
   end
   if (pl.y - originy) % 16 == 0 then
      pl.dy = 0
   end
   
   -- handle eating
   if (btn(4) or btn(5)) then
      pl.mouth_open=true
   end

   local i = ceil((pl.x - originx) / 16 + 0.5)
   local j = ceil((pl.y - originy) / 16 + 0.5)
   if not (btn(4) or btn(5)) then
      if pl.mouth_open and board[i][j] != false then
	 eat(board[i][j])
	 board[i][j] = false
      end
      pl.mouth_open=false	    
   end

end

function _draw()
   camera (0, 0)
   rectfill (0,0,127,127,0) 
   map(0,0, 0,0, 16,16)
   
   clip(originx + 1,originy + 1,originx + (cx-1)*16, originy + (cy-1)*16)
   draw_player()
   draw_board()   
   foreach(troggles, draw_troggle)
   clip()
   
   print("score " .. tostr(score), 0, 116, 7)
   print_center("level " .. tostr(level),1,5)
   draw_title()

   for i = 1,lives do
      spr(0, 30 + 16 * i, 128-16, 2, 2)
   end
end

__gfx__
00000000000000000388888888888330000000770770000003888888888800000000000000000000000000000000000000000000eeeeeeeeeeeeeeee00000000
00000077077000000333333333333330000000780780000003888888888883300000000000000000000000000000000000000000e00000000000000000000000
00000078078000000000030030000000033333773773000003888888888883300000000000000000000000000000000000000000e00000000000000000000000
00000077077000000000030030000000038833333333000003333333333333300000000000000000000000000000000000000000e00000000000000000000000
03333333333300000000030030000000038833333333000000000300300000000000000000000000000000000000000000000000e00000000000000000000000
03333333333300000000030033330000038888888888000000000300333300000000000000000000000000000000000000000000e00000000000000000000000
03883333333300000000030000000000038888888888000000000300000000000000000000000000000000000000000000000000e00000000000000000000000
03883333333300000033330000000000038888888888000000333300000000000000000000000000000000000000000000000000e00000000000000000000000
03888888888803300388888888888330038888888888000003888888888800000000000000000000000000000000000000000000e0000000e000000000000000
03333333333333300333333333333330038888888888833003888888888883300000000000000000000000000000000000000000e00000000000000000000000
00000300300000000000030030000000038888888888833003888888888883300000000000000000000000000000000000000000e00000000000000000000000
00000300300000000000030030000000033333333333333003333333333333300000000000000000000000000000000000000000e00000000000000000000000
00000300300000000000030030000000000003003000000000000300300000000000000000000000000000000000000000000000e00000000000000000000000
00000300300000000033330030000000000003003000000000333300300000000000000000000000000000000000000000000000e00000000000000000000000
00000300300000000000000030000000000003003000000000000000300000000000000000000000000000000000000000000000e00000000000000000000000
00333300333300000000000033330000003333003333000000000000333300000000000000000000000000000000000000000000e00000000000000000000000
00000000000000000222228882222220000000000000000002888222222888200000000000000000022222222222222000000000000000000000000000000000
00002222222200000222222888778870000022222222000002288778877882200000222222220000022222222222222000000000000000000000000000000000
00022222222220000222222888888800000222222222200002288888888882200002222222222000022222222222222000000000000000000000000000000000
00222228888880000022222227887700002288888888220000227887788722000022222222222200002222222222220000000000000000000000000000000000
00222227778777000022222222222200002277788777220000222222222222000022222222222200002222222222220000000000000000000000000000000000
00222227878787000002220022222000002278788787220000000222222220000022222222222200000002222222200000000000000000000000000000000000
02222222222222200000222002200000022222222222222000002220022000000222222222222220000022200220000000000000000000000000000000000000
02222282222222200000000002220000028222222222282000000000022200000222222222222220000000000222000000000000000000000000000000000000
02222288822222200222228882222220028882222228882002888222222888200222222222222220022222222222222000000000000000000000000000000000
02222228887788700222222888778870022887788778822002288778877882200222222222222220022222222222222000000000000000000000000000000000
02222228888888000222222888888800022888888888822002288888888882200222222222222220022222222222222000000000000000000000000000000000
00222222278877000022222227887700002278877887220000227887788722000022222222222200002222222222220000000000000000000000000000000000
00222222222222000022222222222200002222222222220000222222222222000022222222222200002222222222220000000000000000000000000000000000
00022222222220000002222222200000000222222222200000022222222000000002222222222000000222222220000000000000000000000000000000000000
00002200022000000000220002220000000002200220000000000220022200000000022002200000000002200222000000000000000000000000000000000000
00002220022200000000222000000000000022200222000000002220000000000000222002220000000022200000000000000000000000000000000000000000
__map__
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0d0e0d0e0d0e0d0e0d0e0d0e1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f1d0f1d0f1d0f1d0f1d0f1d0f1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0d0e0d0e0d0e0d0e0d0e0d0e1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f1d0f1d0f1d0f1d0f1d0f1d0f1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0d0e0d0e0d0e0d0e0d0e0d0e1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f1d0f1d0f1d0f1d0f1d0f1d0f1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000d0e0d0e0d0e0d0e0d0e0d0e1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001d0f1d0f1d0f1d0f1d0f1d0f1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000d0e0d0e0d0e0d0e0d0e0d0e1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001d0f1d0f1d0f1d0f1d0f1d0f1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000e0e0e0e0e0e0e0e0e0e0e0e1e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
