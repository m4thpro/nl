pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- number lunchers
-- by kisonecat


__gfx__
00000000000000000300000000000330000000770770000000000000000000000000000000000000000000000000000000000000eeeeeeeeeeeeeeee00000000
00000077077000000333333333333330000000700700000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
00000070070000000000030030000000033333773773000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
00000077077000000000030030000000030033333333000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
03333333333300000000030030000000030033333333000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
03333333333300000000030033330000030000000000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
03003333333300000000030000000000030000000000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
03003333333300000033330000000000030000000000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
03000000000003300300000000000330030000000000000000000000000000000000000000000000000000000000000000000000e0000000e000000000000000
03333333333333300333333333333330030000000000033000000000000000000000000000000000000000000000000000000000e00000000000000000000000
00000300300000000000030030000000030000000000033000000000000000000000000000000000000000000000000000000000e00000000000000000000000
00000300300000000000030030000000033333333333333000000000000000000000000000000000000000000000000000000000e00000000000000000000000
00000300300000000000030030000000000003003000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
00000300300000000033330030000000000003003000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
00000300300000000000000030000000000003003000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
00333300333300000000000033330000003333003333000000000000000000000000000000000000000000000000000000000000e00000000000000000000000
00000000000000000222220002222220000000000000000002000222222000200000000000000000022222222222222000000000000000000000000000000000
00002222222200000222222000770070000022222222000002200770077002200000222222220000022222222222222000000000000000000000000000000000
00022222222220000222222000000000000222222222200002200000000002200002222222222000022222222222222000000000000000000000000000000000
00222220000000000022222227007700002200000000220000227007700722000022222222222200002222222222220000000000000000000000000000000000
00222227770777000022222222222200002277700777220000222222222222000022222222222200002222222222220000000000000000000000000000000000
00222227070707000002220022222000002270700707220000000222222220000022222222222200000002222222200000000000000000000000000000000000
02222222222222200000222002200000022222222222222000002220022000000222222222222220000022200220000000000000000000000000000000000000
02222202222222200000000002220000020222222222202000000000022200000222222222222220000000000222000000000000000000000000000000000000
02222200022222200222220002222220020002222220002002000222222000200222222222222220022222222222222000000000000000000000000000000000
02222220007700700222222000770070022007700770022002200770077002200222222222222220022222222222222000000000000000000000000000000000
02222220000000000222222000000000022000000000022002200000000002200222222222222220022222222222222000000000000000000000000000000000
00222222270077000022222227007700002270077007220000227007700722000022222222222200002222222222220000000000000000000000000000000000
00222222222222000022222222222200002222222222220000222222222222000022222222222200002222222222220000000000000000000000000000000000
00022222222220000002222222200000000222222222200000022222222000000002222222222000000222222220000000000000000000000000000000000000
00002200022000000000220002220000000002200220000000000220022200000000022002200000000002200222000000000000000000000000000000000000
00002220022200000000222000000000000022200222000000002220000000000000222002220000000022200000000000000000000000000000000000000000
__map__
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0d0e0d0e0d0e0d0e0d0e0d0e1d0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f1d0f1d0f1d0f1d0f1d0f1d0f1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0d0e0d0e0d0e0d0e0d0e0d0e1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f1d0f1d0f1d0f1d0f1d0f1d0f1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0d0e0d0e0d0e0d0e0d0e0d0e1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f1d0f1d0f1d0f1d0f1d0f1d0f1d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000d0e0d0e0d0e0d0e0d0e0d0e1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001d0f1d0f1d0f1d0f1d0f1d0f1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000d0e0d0e0d0e0d0e0d0e0d0e1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001d0f1d0f1d0f1d0f1d0f1d0f1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000e0e0e0e0e0e0e0e0e0e0e0e1e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
