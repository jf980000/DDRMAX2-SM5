-- single
local t = Def.ActorFrame{
	InitCommand=function(s) s:xy(_screen.cx-270,_screen.cy-142):draworder(99) end,
	GainFocusCommand=function(s) MESSAGEMAN:Broadcast("StyleSingle") end;
	Def.Sprite{
		Texture="_item",
		OnCommand=function(s) s:addx(-88):sleep(0.3):sleep(0.55):decelerate(0.216):addx(88) end,
		GainFocusCommand=function(s) setenv("Style",1) s:glowshift():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,0.5")):effectperiod(0.5) end,
		LoseFocusCommand=cmd(stopeffect);
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		DisabledCommand=cmd(diffuse,color("0.2,0.2,0.2,1"));
		OffCommand=function(s) 
			if getenv("Style") == 1 then
				s:Load(THEME:GetPathG("ScreenSelectStyle","Icon/Single/selected"))
			end
			s:stopeffect():sleep(0.25):accelerate(0.166):addx(-88)
		end,
	};
};
return t;
