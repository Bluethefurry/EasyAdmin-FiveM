
-- EasyAdmin Plugin Example, this allows injecting new UI Elements directly into EasyAdmin Menus, see NativeUILua Docs on Guides how to add new Items, below is an example code.

AddEventHandler("EasyAdmin:BuildPlayerOptions", function(playerId) -- BuildPlayerOptions is triggered after building options like kick, ban.. Passes a Player ServerId
	
	-- comment this out if you want to see it in action
	if false == false then return end


	
	local thisItem = NativeUI.CreateItem("Example Item","Player ID is "..playerId) -- create our new item
	thisPlayer:AddItem(thisItem) -- thisPlayer is global.
	thisItem.Activated = function(ParentMenu,SelectedItem)
		-- do stuff
	end

	if permissions["kick"] then -- you can also check if a user has a specific Permission.
		local thisExampleMenu = _menuPool:AddSubMenu(thisPlayer,"Example Submenu","",true) -- Submenus work, too!
		thisExampleMenu:SetMenuWidthOffset(menuWidth)

		local thisItem = NativeUI.CreateItem("Example Submenu Item","")
		thisExampleMenu:AddItem(thisItem) -- Items dont require a trigger.

	end
end)


AddEventHandler("EasyAdmin:BuildCachedOptions", function(playerId) -- Options for Cached Players, do note that these do not not support Player natives! They're cached BY EASYADMIN
end)

AddEventHandler("EasyAdmin:BuildServerManagementOptions", function() -- Options for the Server Management Submenu, passes nothing.
end)

AddEventHandler("EasyAdmin:BuildSettingsOptions", function() -- Options for the Settings Page, once again, passes nothing
end)