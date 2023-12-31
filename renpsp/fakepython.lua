function RenpyClass(renpy)
	renpy.sound  = {}
	renpy.music  = {}
	renpy.random = {}

	--original functions:

	function renpy.pause(nseconds)
		ENGINE:Timer(tonumber(nseconds*1000))
		ENGINE.state.hide_text = true
		ENGINE.script.continue = false
	end

	function renpy.block_rollback()
		ENGINE:DestroyHistory()
	end

	function renpy.error(err)
		ENGINE:ErrorState(tostring(err))
	end

	function renpy.quit()
		ENGINE:Quit()
	end

	function renpy.jump(lbl)
		ENGINE:Jump(lbl)
	end

	function renpy.has_label(lbl)
		return ENGINE.script.gamelabels[lbl]~=nil
	end

	function renpy.sound.play(snd,ch,loop)
		ENGINE:PlaySound(snd,ch,loop)
	end

	function renpy.sound.stop(ch)
		ENGINE:StopSound(ch)
	end

	function renpy.sound.set_volume(vol,ch)
		ENGINE:SetVolume(vol,ch)
	end

	function renpy.music.play(snd,ch,loop)
		ENGINE:PlayMusic(snd,ch,loop)
	end

	function renpy.music.stop(ch)
		ENGINE:StopMusic(ch)
	end

	function renpy.music.set_volume(vol,ch)
		ENGINE:SetVolume(vol,ch)
	end

	function renpy.take_screenshot()
		ENGINE:TakeScreenshot()
	end

	function renpy.screenshot(fname)
		screen:save(fname)
	end
	
	function renpy.gotohelp()
		ENGINE:Help()
	end

	--selfmade functions:

	function renpy.print(l)
		GAME_print(tostring(l))
	end
	
    --WEETABIX NOTE: TESTED ON ACTUAL PSP, CRASHES OCCUR, FIX WILL BE DEPLOYED IN THE FUTURE
	function renpy.input(desc,def)
            local textout = ""
		if CURRENT_SYSTEM == "LPE" then
			ans, res = System.osk(desc, def, System.OSK_INPUTTYPE_ALL, drawFunc)
			if (res==System.OSK_RESULT_UNCHANGED) then
				textout = def
			elseif (res==System.OSK_RESULT_CANCELLED) then
				textout = def
			elseif (res==System.OSK_RESULT_CHANGED) then
				textout = ans
			end
		elseif CURRENT_SYSTEM == "LPP" then
			System.oskInit(desc,def)
			res, ans = System.oskUpdate()
			if res == true then
				textout = ans
			elseif res == false then
				textout = def
			end
		else
			textout = def
		end
            return textout
	end
        
	function renpy.load(anon)
		loadconf = ENGINE:Load(anon)
		if loadconf == false then
			return 1 < 0
		end
	end
        
	function renpy.save(anon)
		ENGINE:Save(anon)
	end
        
	function renpy.text(blah)
		ENGINE:TextBoxOut(blah)
	end
	
	function renpy.importLua(file)
		dofile(file)
	end
	
	function renpy.movie_cutscene()
	end
        
end
