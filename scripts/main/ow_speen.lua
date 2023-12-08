local Speen = {}

function Speen:init()
	print("Loaded Speen")
	self.spin_sound = Assets.newSound("spin_jump")
	self.speen_sound = Assets.newSound("speen")

	self.rotat_e_sound = love.audio.newSource(Assets.getMusicPath("voiceover/rotat_e"), "stream")

	self.lancer_sound = Assets.newSound("lancer-spin")
	self.lancer_sound:setLooping(true)
	self.lancer_sprites = {}

	self.beyblade_sound = love.audio.newSource(Assets.getMusicPath("full_beyblade_theme_song"), "stream")

	self.rotate_speed = 1/4

	self.timer = 0

	self.is_spinning = false
	self.current_facing = "down"

	Utils.hook(Player, "isMovementEnabled",
        ---@return boolean
        ---@diagnostic disable-next-line: redefined-local
        function(orig, g_self)
            ---@diagnostic disable-next-line: redundant-return-value
            return orig(g_self)
                and not self.is_spinning
        end
    )
end

function Speen:update()
	if Input.pressed("s", false)
		and not self.is_spinning
		and (Game.state == "OVERWORLD" and Game.world.state == "GAMEPLAY" and not Game.world:hasCutscene())
		and not (Game.lock_movement or self.taunt_lock_movement)
		and not (OVERLAY_OPEN or TextInput.active)
	then
		self.is_spinning = true
		self.current_facing = "down"
		self.timer = FRAMERATE*self.rotate_speed
		self.lancered = love.math.random(0, 100) <= 25
		self.beyblade = love.math.random(0, 100) <= 10
		self.rotat_e = love.math.random(0, 100) <= 5
		if self.lancered then
			self.lancer_sound:play()
			for i=1,4 do
				local l = Sprite("world/the_boy")
				l:play(self.rotate_speed)
				l:setScale(2)
				l:setLayer(WORLD_LAYERS["top"])
				Game.world:addChild(l)
				if i == 1 then
					l:setScreenPos(0, 0)
				elseif i == 2 then
					l:setScreenPos(SCREEN_WIDTH-l.width*2, 0)
				elseif i == 3 then
					l:setScreenPos(0, SCREEN_HEIGHT-l.height*2)
				elseif i == 4 then
					l:setScreenPos(SCREEN_WIDTH-l.width*2, SCREEN_HEIGHT-l.height*2)
				end
				table.insert(self.lancer_sprites, l)
			end
			Game.world.music:pause()
		elseif self.rotat_e then
			self.rotat_e_sound:play()
			Game.world.music:pause()
		elseif self.beyblade then
			self.beyblade_sound:play()
			Game.world.music:pause()
		elseif love.math.random(1, 50) == 1 then
			self.speen_sound:play()
		else
			self.spin_sound:play()
		end
	end

	if self.is_spinning then
		self.timer = self.timer + DTMULT

		if self.timer >= self.rotate_speed then
			self.timer = 0
			for i,member in ipairs(Game.party) do
				local chara = Game.world:getCharacter(member.id)
				-- compensate for duplicate actors in the party room
				if Game.world:getCharacter(member.id, 2) then
					chara = Game.world:getCharacter(member.id, 2)
				end
				if chara then
					chara.sprite:setFacing(self.current_facing)
				end
			end
			self:nextFacing()
		end
		if not Input.down("s") then
			self.is_spinning = false
			if self.lancered then
				self.lancered = false
				for i,lancer in ipairs(self.lancer_sprites) do
					lancer:remove()
				end
				self.lancer_sprites = {}
				Game.world.music:resume()
				self.lancer_sound:stop()
			end
			if self.beyblade then
				self.beyblade = false
				Game.world.music:resume()
				self.beyblade_sound:stop()
			end
			if self.rotat_e then
				self.rotat_e = false
				Game.world.music:resume()
				self.rotat_e_sound:stop()
			end
		end
	end
end

function Speen:nextFacing()
	local order = {"down", "up", "left", "right"}
	for i,facing in ipairs(order) do
		if self.current_facing == facing then
			if i == #order then
				self.current_facing = order[1]
			else
				self.current_facing = order[i+1]
			end
			break
		end
	end
end

return Speen