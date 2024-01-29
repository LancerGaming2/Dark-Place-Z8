return {
    wall = function(cutscene)
        -- Open textbox and wait for completion
        cutscene:text("* The wall seems cracked.")

        -- If we have Susie, play a cutscene
        local susie = cutscene:getCharacter("susie")
        if susie then
            -- Detach camera and followers (since characters will be moved)
            cutscene:detachCamera()
            cutscene:detachFollowers()

            -- All text from now is spoken by Susie
            cutscene:setSpeaker(susie)
            cutscene:text("* Hey,[wait:5] think I can break\nthis wall?", "smile")

            -- Get the bottom-center of the broken wall
            local x = event.x + event.width/2
            local y = event.y + event.height/2

            -- Move Susie up to the wall over 0.75 seconds
            cutscene:walkTo(susie, x, y + 40, 0.75, "up")
            -- Move other party members behind Susie
            cutscene:walkTo(Game.world.player, x, y + 100, 0.75, "up")
            if cutscene:getCharacter("ralsei") then
                cutscene:walkTo("ralsei", x + 60, y + 100, 0.75, "up")
            end
            if cutscene:getCharacter("noelle") then
                cutscene:walkTo("noelle", x - 60, y + 100, 0.75, "up")
            end

            -- Wait 1.5 seconds
            cutscene:wait(1.5)

            -- Walk back,
            cutscene:wait(cutscene:walkTo(susie, x, y + 60, 0.5, "up", true))
            -- and run forward!
            cutscene:wait(cutscene:walkTo(susie, x, y + 20, 0.2))

            -- Slam!!
            Assets.playSound("impact")
            susie:shake(4)
            susie:setSprite("shock_up")

            -- Slide back a bit
            cutscene:slideTo(susie, x, y + 40, 0.1)
            cutscene:wait(1.5)

            -- owie
            susie:setAnimation({"away_scratch", 0.25, true})
            susie:shake(4)
            Assets.playSound("wing")

            cutscene:wait(1)
            cutscene:text("* Guess not.", "nervous")

            -- Reset Susie's sprite
            susie:resetSprite()

            -- Reattach the camera
            cutscene:attachCamera()

            -- Align the follower positions behind Kris's current position
            cutscene:alignFollowers()
            -- And reattach them, making them return to their target positions
            cutscene:attachFollowers()
            Game:setFlag("wall_hit", true)
        end
    end,
    test = function(cutscene, actor)
        local master = cutscene:getCharacter("test_master")
        master:setAnimation({"bop", 0.25, true})
        cutscene:text("* I'm test Master.\n[wait:5]* Ask me about TEST's.")

        local choices = {"1", "2", "3"}
        table.insert(choices, "Bye")
        local c = cutscene:choicer(choices)
        if c == 1 then
            master:setAnimation({"shocked", 0.25, true})
            cutscene:text("* BING BING BING ONE.")
        elseif c == 2 then
            master:setAnimation({"shocked", 0.25, true})
            cutscene:text("* BING BING BING TWO.")
        elseif c == 3 then
            master:setAnimation({"shocked", 0.25, true})
            cutscene:text("* BING BING BING THREE.")
        elseif c == 4 then
            cutscene:text("* Later,[wait:5] kid.")
        end
        master:setAnimation({"idle", 0.25, true})
    end,
    kris = function(cutscene)
        cutscene:text("* I'm Kris Master.\n[wait:5]* Ask me about KRIS's.")

        local choices = {"Reviving", "Acting", "Fact"}
        table.insert(choices, "Bye")
        local c = cutscene:choicer(choices)
        if c == 1 then
            cutscene:text("* When HP goes negative,[wait:5] your friends fall down")
            cutscene:text("* But bringing them back,[wait:5] is easy town")
            cutscene:text("* Plain foods and spells,[wait:5] work like a charm -")
            cutscene:text("* And with a MINT,[wait:5] you can cure all HARM.")
        elseif c == 2 then
            cutscene:text("* If you only ACT,[wait:5] you might start to think -")
            cutscene:text("* What about the guy with the scarf in pink?")
            cutscene:text("* They are the one to keep things FAIR.")
            cutscene:text("* So end this battle with a second SPARE.")
        elseif c == 3 then
            cutscene:text("* It's a good idea,[wait:5] to give us BUCKs.")
            cutscene:text("* It'll make Kris happy,[wait:5] and fill them with LUCKs.")
            cutscene:text("* Over there,[wait:5] is our DONATION HOLE.")
            cutscene:text("* We had a BOX,[wait:5] but it got STOLE.")
        elseif c == 4 then
            cutscene:text("* Later,[wait:5] kid.")
        end

    end,
    susie = function(cutscene)
        cutscene:text("* I'm Susie Master.\n[wait:5]* Ask me about SUSIE's.")

        local choices = {"Healing", "Attack", "Fact"}
        table.insert(choices, "Bye")
        local c = cutscene:choicer(choices)
        if c == 1 then
            cutscene:text("* Susie puts all her POWER,[wait:5] in this one SPELL.")
            cutscene:text("* This will send your TENSION,[wait:5] straight to HELL.")
            cutscene:text("* Susie's ULTIMATE HEAL,[wait:5] is so RAD.")
            cutscene:text("* Unfortunely it's also,[wait:5] very[wait:5] very[wait:5] BAD.")
        elseif c == 2 then
            cutscene:text("* Susie's BUSTER, RUDE as may be...")
            cutscene:text("* Will deal more damage, if you just press [Z]!")
        elseif c == 3 then
            cutscene:text("* I now can see Susie's eye.")
            cutscene:text("* Which means she's learned PACIFY.")
        elseif c == 4 then
            cutscene:text("* Later,[wait:5] kid.")
        end

    end,
    YOU = function(cutscene)
        cutscene:text("* I'm You Master.\n[wait:5]* Ask me about YOU's.")

        local choices = {"Ribbit", "Sending", "Fact"}
        table.insert(choices, "Bye")
        local c = cutscene:choicer(choices)
        if c == 1 then
            cutscene:text("* You's eyes,[wait:5] are quite the SHOW.")
            cutscene:text("* In dark rooms,[wait:5] they even GLOW.")
            cutscene:text("* Their origins however,[wait:5] are very unclear.")
            cutscene:text("* Press [A] to CROAK.")
            cutscene:text("[speed:0.5]*\n                :D  ")
        elseif c == 2 then
            cutscene:text("* You's SEND,[wait:5] is quite strange.")
            cutscene:text("* What it replaces doesn't change.")
            cutscene:text("* It's just another way to SPARE.")
            cutscene:text("* All of the options are still THERE.")
        elseif c == 3 then
            cutscene:text("* You loves to give us DOLLARS.")
            cutscene:text("* They'll[speed:0.1]...")
            cutscene:text("* [wait:8][speed:0.5]Uhh...")
            cutscene:text("* [speed:0.7][wait:5]Destroy,[wait:8][speed:0.5] scam,[wait:10] [speed:0.3]CALLERS?")
        elseif c == 4 then
            cutscene:text("* Later,[wait:5] kid.")
        end

    end,
    dess = function(cutscene)
        cutscene:text("* I'm Dess Master.\n[wait:5]* Don't ask me about DESS's.")

        local choices = {"1", "2", "Fact"}
        table.insert(choices, "Bye")
        local c = cutscene:choicer(choices)
        if c == 1 then
            cutscene:text("* Dess's power of the STARS.")
            cutscene:text("* Will[wait:5] HOPEFULLY[wait:5] get her run over by CARS.")
        elseif c == 2 then
            cutscene:text("* BING BING BING TWO.")
        elseif c == 3 then
            cutscene:text("* Dess will stop being annoying,[wait:5] if you give me money to buy cigarettes.")
            cutscene:text("* Sorry,[wait:5] that was a lie.")
            cutscene:text("* Give me money,[wait:5] to buy cigarettes.")
        elseif c == 4 then
            cutscene:text("* Later,[wait:5] Chum.")
        end

    end,
}