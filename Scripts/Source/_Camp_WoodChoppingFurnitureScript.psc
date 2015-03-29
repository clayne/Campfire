scriptname _Camp_WoodChoppingFurnitureScript extends ObjectReference

Quest property _Camp_MainQuest auto
FormList property woodChoppingAxes auto
Actor property PlayerRef auto

weapon EquippedWeapon

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef as Actor) == Game.GetPlayer()
		;debug.trace("[Frostfall] I was activated by the player!")
		RegisterForSingleUpdate(0.5)
	endif
endEvent

Event OnUpdate()
	;debug.trace("[Frostfall] Updating...")
	if self.IsFurnitureInUse()
		;debug.trace("[Frostfall] I am in use by the player!")
		(_Camp_MainQuest as _Camp_ConditionValues).IsChoppingWood = true
		if woodChoppingAxes.HasForm(PlayerRef.GetEquippedWeapon())
			EquippedWeapon = PlayerRef.GetEquippedWeapon()
			PlayerRef.UnequipItem(EquippedWeapon as Form, abSilent = true)
		endif
		RegisterForSingleUpdate(0.25)
	else
		;debug.trace("[Frostfall] I am not in use by the player!")
		(_Camp_MainQuest as _Camp_ConditionValues).IsChoppingWood = false
		if EquippedWeapon != none
			PlayerRef.EquipItem(EquippedWeapon as Form, abSilent = true)
			EquippedWeapon = none
		endif
	endif
endEvent