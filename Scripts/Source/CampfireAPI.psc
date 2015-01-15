scriptname CampfireAPI extends Quest

;#Properties =======================================================================
CampfireData property CampData auto
Actor property PlayerRef auto
Formlist property _Camp_WorldspacesInteriors auto
Keyword property isPlaceableItem auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto

Formlist property _Camp_TentActivators auto
Formlist property _Camp_FurTentsSmall auto
Formlist property _Camp_FurTentsLarge auto
Formlist property _Camp_LeatherTentsSmall auto
Formlist property _Camp_LeatherTentsLarge auto
Formlist property _Camp_ConjuredShelters auto

int next_thread_id = 0
int property NextThreadId
	int function get()
		next_thread_id += 1
		return next_thread_id
	endFunction
endProperty
