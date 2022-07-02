/obj/item/weapon/reagent_containers/food/snacks/bacon
	name = "slice of bacon"
	desc = "A very tasty, thick slice of cooked bacon! Crispy yet still has a bit of chew to it, with some added salt. Will make any mouth salivate. May or may not increase likelihood heart disease."
	icon_state = "bacon"
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/bacon/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/sodiumchloride, 1)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 4)

/obj/item/weapon/reagent_containers/food/snacks/rawbacon
	name = "raw slice of bacon"
	desc = "A slice of salted raw bacon. Do not eat, tastes much better cooked"
	icon_state = "rawbacon"
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/rawbacon/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 4)
	reagents.add_reagent(/datum/reagent/sodiumchloride, 1)

/obj/item/weapon/reagent_containers/food/snacks/baconcheeseburger
	name = "bacon cheeseburger"
	desc = "A cheeseburger with some bacon in it. Yum!"
	icon_state = "bacon_cheeseburger"
	bitesize = 6

/obj/item/weapon/reagent_containers/food/snacks/baconcheeseburger/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/sodiumchloride, 1)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 18)
	reagents.add_reagent(/datum/reagent/nutriment, 4)

/obj/item/weapon/reagent_containers/food/snacks/deluxebaconcheeseburger
	name = "deluxe bacon cheeseburger"
	desc = "A sizeable burger. Contains bacon and burger meat, cheese, tomato, cabbage, set of buns, and a secret burger sauce. Fills one up, though may shorten one's life expectancy."
	icon_state = "deluxe_bacon_cheeseburger"
	bitesize = 6

/obj/item/weapon/reagent_containers/food/snacks/deluxebaconcheeseburger/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/sodiumchloride, 3)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 24)
	reagents.add_reagent(/datum/reagent/nutriment, 8)

/obj/item/weapon/reagent_containers/food/snacks/baconandeggs
	name = "bacon and eggs"
	desc = "Some slices of bacon and eggs. It kind of looks like some sort of smiling face if you look at it enough."
	icon_state = "bacon_and_eggs"
	bitesize = 5

/obj/item/weapon/reagent_containers/food/snacks/baconandeggs/Initialize()
	..()
	reagents.add_reagent(/datum/reagent/sodiumchloride, 3)
	reagents.add_reagent(/datum/reagent/blackpepper, 1)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 8)
	reagents.add_reagent(/datum/reagent/nutriment/protein/egg, 8)

/obj/item/weapon/reagent_containers/food/snacks/blt
	name = "BLT sandwich"
	desc = "A pile of bacon with lettuce and tomatoes, slapped between 2 slices of bread. Optionally with mayo."
	icon_state = "blt"
	trash = /obj/item/trash/plate

/obj/item/weapon/reagent_containers/food/snacks/blt/Initialize()
	. = ..()
	bitesize = 4
	reagents.add_reagent(/datum/reagent/sodiumchloride, 2)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)
	reagents.add_reagent(/datum/reagent/nutriment, 8)

/obj/item/weapon/reagent_containers/food/snacks/sliceable/xlclubsandwich
	name = "XL club sandwich"
	desc = "A monstrous beast of a sandwich. A set of 3 slightly toasted bread slices, piled in high with bacon, turkey, lettuce, tomatoes, and optionally mayo. All in an extra large and tasty version."
	icon_state = "xlclubsandwich"
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/xlclubslice
	slices_num = 4
	trash = /obj/item/trash/plate
	bitesize = 10

/obj/item/weapon/reagent_containers/food/snacks/sliceable/xlclubsandwich/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/sodiumchloride, 4)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 40)
	reagents.add_reagent(/datum/reagent/nutriment, 14)

/obj/item/weapon/reagent_containers/food/snacks/xlclubslice
	name = "Slice of XL club sandwich"
	desc = "A slice of a monstrous beast of a sandwich. A set of 3 slightly toasted bread slices, piled in high with bacon, turkey, lettuce, tomatoes, and optionally mayo. All in an extra large and tasty version."
	icon_state = "xlclubslice"
	bitesize = 5

/obj/item/weapon/reagent_containers/food/snacks/xlclubslice/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/sodiumchloride, 1)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)
	reagents.add_reagent(/datum/reagent/nutriment, 4)

/obj/item/weapon/reagent_containers/food/snacks/lobster
	name = "raw lobster"
	desc = "A shifty lobster. You can try eating it, but its shell is extremely tough."
	icon_state = "lobster_raw"
	nutriment_amt = 5
	bitesize = 0.1

/obj/item/weapon/reagent_containers/food/snacks/lobstercooked
	name = "cooked lobster"
	desc = "A luxurious plate of cooked lobster, its taste accentuated by lemon juice. Reinvigorating!"
	icon_state = "lobster_cooked"
	trash = /obj/item/trash/plate
	nutriment_amt = 20
	nutriment_desc = list("lemon" = 2, "lobster" = 5, "salad" = 2)
	bitesize = 5

/obj/item/weapon/reagent_containers/food/snacks/lobstercooked/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 20)

/obj/item/weapon/reagent_containers/food/snacks/cuttlefish
	name = "raw cuttlefish"
	desc = "It's an adorable squid! you can't possible be thinking about eating this right?"
	icon_state = "cuttlefish_raw"
	nutriment_amt = 5
	bitesize = 10

/obj/item/weapon/reagent_containers/food/snacks/cuttlefishcooked
	name = "cooked cuttlefish"
	desc = "It's a roasted cuttlefish. rubbery, squishy, an acquired taste."
	icon_state = "cuttlefish_cooked"
	nutriment_amt = 20
	nutriment_desc = list("cuttlefish" = 5, "rubber" = 5, "grease" = 1)
	bitesize = 5

/obj/item/weapon/reagent_containers/food/snacks/cuttlefishcooked/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)

/obj/item/weapon/reagent_containers/food/snacks/sliceable/monkfish
	name = "extra large monkfish"
	desc = "It's a huge monkfish. better clean it first, you can't possibly eat it like this."
	icon = 'icons/obj/food48x48.dmi'
	icon_state = "monkfish_raw"
	nutriment_amt = 30
	w_class = ITEM_SIZE_HUGE //Is that a monkfish in your pocket, or are you just happy to see me?
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/monkfishfillet
	slices_num = 6
	trash = /obj/item/weapon/reagent_containers/food/snacks/sliceable/monkfishremains
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/monkfishfillet
	name = "monkfish fillet"
	desc = "It's a fillet sliced from a monkfish."
	icon_state = "monkfish_fillet"
	nutriment_amt = 5
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/monkfishfillet/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 1)

/obj/item/weapon/reagent_containers/food/snacks/monkfishcooked
	name = "seasoned monkfish"
	desc = "a delicious slice of monkfish prepared with sweet chili and spring onion."
	icon_state = "monkfish_cooked"
	nutriment_amt = 10
	nutriment_desc = list("fish" = 3, "oil" = 1, "sweet chili" = 3, "spring onion" = 2)
	trash = /obj/item/trash/fancyplate
	bitesize = 4

/obj/item/weapon/reagent_containers/food/snacks/monkfishcooked/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)

/obj/item/weapon/reagent_containers/food/snacks/sliceable/monkfishremains
	name = "monkfish remains"
	icon_state = "monkfish_remains"
	desc = "The work of a madman."
	w_class = ITEM_SIZE_LARGE
	nutriment_amt = 10
	slice_path = /obj/item/clothing/head/fish
	slices_num = 1
	bitesize = 0.01 //impossible to eat

/obj/item/weapon/reagent_containers/food/snacks/sliceable/monkfishremains/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/carbon, 5)

/obj/item/weapon/reagent_containers/food/snacks/sliceable/shark
	name = "a measelshark"
	desc = "This beast used to terrorize the sea with its pathogens, incredibly tasty seeing humans can't catch sea-measels."
	icon_state = "measelshark"
	icon = 'icons/obj/food_shark.dmi'
	nutriment_amt = 5
	w_class = ITEM_SIZE_HUGE
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/sliceable/sharkchunk
	slices_num = 6
	bitesize = 0.01

/obj/item/weapon/reagent_containers/food/snacks/sliceable/sharkchunk
	name = "chunk of shark meat"
	desc = "Still rough, needs to be cut into even smaller chunks."
	icon_state = "sharkmeat_chunk"
	nutriment_amt = 15
	w_class = ITEM_SIZE_LARGE
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/sharkmeat
	slices_num = 5
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/sliceable/sharkchunk/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 20)

/obj/item/weapon/reagent_containers/food/snacks/sharkmeat
	name = "a slice of sharkmeat"
	desc = "A raw cut of shark meat."
	icon_state = "sharkmeat"
	nutriment_amt = 2
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/sharkmeat/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 2)

/obj/item/weapon/reagent_containers/food/snacks/sharkmeatcooked
	name = "shark steak"
	desc = "Finally, some food for real men."
	icon_state = "sharkmeat_cooked"
	nutriment_amt = 5
	trash = /obj/item/trash/plate
	nutriment_desc = list("manliness" = 1, "fish oil" = 2, "shark" = 2)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/sharkmeatcooked/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 8)

/obj/item/weapon/reagent_containers/food/snacks/sharkmeatdip
	name = "hot shark shank"
	desc = "A shank of shark meat dipped in hot sauce."
	icon_state = "sharkmeat_dip"
	nutriment_amt = 5
	trash = /obj/item/trash/snack_bowl
	nutriment_desc = list("salt" = 1, "fish oil" = 2, "spicy shark" = 2)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/sharkmeatdip/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/capsaicin, 4)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 4)

/obj/item/weapon/reagent_containers/food/snacks/sharkmeatcubes
	name = "shark cubes"
	desc = "Foul-scented, fermented shark cubes. It's said to make men fly . . . or just really fat."
	icon_state = "sharkmeat_cubes"
	nutriment_amt = 8
	trash = /obj/item/trash/plate
	nutriment_desc = list("viking spirit" = 1, "rot" = 2, "fermented sauce" = 2)
	bitesize = 10

/obj/item/weapon/reagent_containers/food/snacks/sharkmeatcubes/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/drink/juice/potato, 30) // for people who want to get fat, FAST.

/obj/item/weapon/reagent_containers/food/snacks/sliceable/jellycube
	name = "jello cube"
	desc = "A cube of evil jello, it still needs to be shaped with a knife."
	icon_state = "jellycube"
	slice_path = /obj/random/necrojelly
	nutriment_amt = 1
	slices_num = 1
	bitesize = 3

/obj/random/necrojelly
	name = "random jello"
	desc = "This is a random jello."
	icon = 'icons/obj/food.dmi'
	icon_state = "necrojelly"

/obj/random/necrojelly/item_to_spawn() //7,61% to be not jelly
	return pickweight(list(/obj/item/weapon/reagent_containers/food/snacks/necrojelly = 9239,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/tormentor = 1,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/spitter = 100,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/cursed = 100,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/lurker = 100,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/exploder = 100,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/puker = 100,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/ubermorph = 50,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/infector = 50,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/tripod = 10,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/divider = 50,
				/obj/item/weapon/reagent_containers/food/snacks/necrojelly/enhancedslasher = 100))

/obj/item/weapon/reagent_containers/food/snacks/necrojelly
	name = "suspicious jello"
	desc = "The chef's creativity appears to be oddly menacing."
	icon_state = "necrojelly"
	nutriment_amt = 10
	nutriment_desc = list("Evil" = 10)
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/drink/milk = 5)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/tormentor
	icon = 'icons/obj/food150x128.dmi'
	icon_state = "tormentor"
	name = "Obscenely Terrifying Jello"
	desc = "Even the chef can't explain how this monstrosity came to be, much less how it might ever be reproduced."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/tormentor/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 30)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/cursed
	icon = 'icons/obj/food48x48.dmi'
	icon_state = "cursed"
	name = "Cursed Jello"
	desc = "A truly cursed creation, no one really knows what it's meant to represent."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/cursed/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/spitter
	icon = 'icons/obj/food48x48.dmi'
	icon_state = "spitter"
	name = "Ill Mannered Jello"
	desc = "You feel as if this jello might spit at you at any moment."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/spitter/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/puker
	icon = 'icons/obj/food48x48.dmi'
	icon_state = "puker"
	name = "Disgusting Jello"
	desc = "You don't see how anyone would be able to eat this without vomiting."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/puker/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/enhancedslasher
	icon = 'icons/obj/food48x48.dmi'
	icon_state = "enhanced_slasher"
	name = "Enhanced Cursed Jello"
	desc = "The fear factor this jello inspires has been enhanced, freakishly enough."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/enhancedslasher/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/lurker
	icon = 'icons/obj/food48x48.dmi'
	icon_state = "lurker"
	name = "Lurking Evil Jello"
	desc = "Someone asked the chef to model this jello after their dog, little did they know the chef is a terrible artist."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/lurker/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/exploder
	icon = 'icons/obj/food48x48.dmi'
	icon_state = "exploder"
	name = "Explosive Jello"
	desc = "This horrifying jello seems highly unstable, representing feelings of bottled anger within the chef."
	bitesize = 2
	reagent_flags = ATOM_FLAG_NO_REACT

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/exploder/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/water, 1)
	reagents.add_reagent(/datum/reagent/potassium, 1)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/ubermorph
	icon = 'icons/obj/food48x64.dmi'
	icon_state = "ubermorph"
	name = "Overwhelmingly Evil Jello"
	desc = "Modern art, or simply the creation of a drugged up culinary expert, you decide."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/ubermorph/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/divider
	icon = 'icons/obj/food48x64.dmi'
	icon_state = "divider"
	name = "Spaghetti Monster Jello"
	desc = "A decidedly italian iteration of the modern evil jello."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/divider/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/infector
	icon = 'icons/obj/food64x64.dmi'
	icon_state = "infector"
	name = "Infectiously Evil Jello"
	desc = "A jello so wicked it almost makes you feel as evil as the chef who created it."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/infector/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/tripod
	icon = 'icons/obj/food96x96.dmi'
	icon_state = "tripod"
	name = "Terrifyingly Evil Jello"
	desc = "Quite the monstrosity, it makes you question the creator."
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/necrojelly/tripod/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 15)

/*
/obj/item/weapon/reagent_containers/food/snacks/donut
	name = "donut"
	desc = "Goes great with Robust Coffee."
	icon_state = "donut1"
	filling_color = "#d9c386"
	var/overlay_state = "box-donut1"
	center_of_mass = "x=13;y=16"
	nutriment_desc = list("sweetness", "donut")

/obj/item/weapon/reagent_containers/food/snacks/donut/normal
	name = "donut"
	desc = "Goes great with Robust Coffee."
	icon_state = "donut1"
	nutriment_amt = 3
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/donut/normal/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/sprinkles, 1)
	if(prob(30))
		icon_state = "donut2"
		overlay_state = "box-donut2"
		name = "frosted donut")
		reagents.add_reagent(/datum/reagent/nutriment/sprinkles, 2)
		center_of_mass = "x=19;y=16"
	*/