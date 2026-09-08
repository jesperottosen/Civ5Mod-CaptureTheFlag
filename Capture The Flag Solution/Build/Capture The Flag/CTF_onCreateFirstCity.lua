-- CTF_CreateFlagUnits
-- Author: yepzer
-- DateCreated: 9/8/2026 4:46:21 PM
--------------------------------------------------------------

print ("Loaded OK")

function onCreateFirstCity(iPlayer, cityX, cityY) 

	-- init
	if (iPlayer == nil) then return end
	if (Players[iPlayer] == nil) then return end
	if (Players[iPlayer]:IsMinorCiv()) then return end
	if (cityX == nil) then return end
	if (cityY == nil) then return end

	-- if one city
	if (Players[iPlayer]:GetNumCities() == 1) then
		print("one city")

		-- create unit, if max not reached
		pPlayer = Players[iPlayer]
		local canTrain = pPlayer:CanTrain(GameInfo.Units["UNIT_OWNFLAG"].ID, true, true, true, false)
		if (canTrain) then			
			pPlayer:InitUnit(GameInfo.Units["UNIT_OWNFLAG"].ID, cityX, cityY)
		end
	end

	print("qed")

end 

--------------------------------------------------------------

GameEvents.PlayerCityFounded.Add( onCreateFirstCity )