return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 44,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 87,
  properties = {
    ["music"] = "greenroom",
    ["name"] = "Dev Diner - Dining Area"
  },
  tilesets = {
    {
      name = "devroom",
      firstgid = 1,
      filename = "../../../../tilesets/devroom.tsx",
      exportfilename = "../../../../tilesets/devroom.lua"
    },
    {
      name = "devroom-objects",
      firstgid = 73,
      filename = "../../../../tilesets/devroom-objects.tsx",
      exportfilename = "../../../../tilesets/devroom-objects.lua"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "objects_bg",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 44,
      height = 12,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        8, 8, 8, 9, 8, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 8, 8, 8,
        8, 8, 8, 9, 8, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 8, 8, 8,
        8, 8, 8, 9, 8, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 18, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 8, 8, 8,
        8, 8, 8, 9, 8, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 8, 8, 5, 5, 6, 9, 8, 8, 8,
        8, 8, 8, 9, 5, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 8, 8, 2, 2, 3, 6, 8, 8, 8,
        5, 5, 5, 6, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 3, 8, 8, 8,
        2, 2, 2, 2, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 8, 8, 8,
        14, 14, 14, 14, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 8, 8, 8,
        8, 8, 8, 8, 13, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 15, 8, 8, 8,
        8, 8, 8, 8, 8, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 8, 8, 14, 14, 15, 8, 8, 8, 8,
        8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 7, 9, 8, 8, 8, 8, 8, 8, 8,
        8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 7, 9, 8, 8, 8, 8, 8, 8, 8
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects_props",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 84,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1400,
          y = 160,
          width = 80,
          height = 120,
          rotation = 0,
          gid = 94,
          visible = true,
          properties = {}
        },
        {
          id = 86,
          name = "",
          class = "",
          shape = "rectangle",
          x = 280,
          y = 160,
          width = 290,
          height = 128,
          rotation = 0,
          gid = 95,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 200,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 320,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          class = "",
          shape = "rectangle",
          x = 160,
          y = 120,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          class = "",
          shape = "rectangle",
          x = 200,
          y = 120,
          width = 1200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1480,
          y = 120,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          class = "",
          shape = "rectangle",
          x = 160,
          y = 360,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          class = "",
          shape = "rectangle",
          x = 200,
          y = 400,
          width = 1200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1640,
          y = 200,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1600,
          y = 120,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1600,
          y = 360,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          class = "",
          shape = "rectangle",
          x = 880,
          y = 320,
          width = 100,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1120,
          y = 320,
          width = 100,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1240,
          y = 240,
          width = 100,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1360,
          y = 320,
          width = 100,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1480,
          y = 240,
          width = 100,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          class = "",
          shape = "rectangle",
          x = 760,
          y = 240,
          width = 100,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1000,
          y = 240,
          width = 100,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "",
          class = "",
          shape = "rectangle",
          x = 520,
          y = 240,
          width = 100,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "",
          class = "",
          shape = "rectangle",
          x = 640,
          y = 320,
          width = 100,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 62,
          name = "",
          class = "",
          shape = "rectangle",
          x = 330,
          y = 148,
          width = 190,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1480,
          y = 400,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1360,
          y = 440,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 70,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1480,
          y = 440,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 25,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 1400,
          y = 108,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "devhotel/devdiner/partyroom",
            ["marker"] = "entry"
          }
        },
        {
          id = 49,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = -40,
          y = 240,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "devhotel/devdiner/devstart",
            ["marker"] = "entry"
          }
        },
        {
          id = 58,
          name = "npc",
          class = "",
          shape = "point",
          x = 425,
          y = 153,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "shadowsalesman",
            ["cutscene"] = "devroom.shadowshop"
          }
        },
        {
          id = 63,
          name = "npc",
          class = "",
          shape = "point",
          x = 810,
          y = 180,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "brandon",
            ["cutscene"] = "devroom.brandon",
            ["flagcheck"] = "!brandon_inparty"
          }
        },
        {
          id = 64,
          name = "npc",
          class = "",
          shape = "point",
          x = 1119,
          y = 180,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "dumbie",
            ["cutscene"] = "devroom.dumbie",
            ["flagcheck"] = "!dumbie_inparty"
          }
        },
        {
          id = 65,
          name = "npc",
          class = "",
          shape = "point",
          x = 200,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "velvet",
            ["cutscene"] = "devroom.velvet"
          }
        },
        {
          id = 67,
          name = "npc",
          class = "",
          shape = "point",
          x = 810,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "brandon",
            ["cond"] = "Game:getFlag(\"brandon_inparty\") and not Game:hasPartyMember(\"brandon\")",
            ["cutscene"] = "partyroom.brandon"
          }
        },
        {
          id = 71,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 1400,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "devhotel/devhotel_lobby",
            ["marker"] = "north"
          }
        },
        {
          id = 73,
          name = "",
          class = "",
          shape = "rectangle",
          x = 325,
          y = 190,
          width = 200,
          height = 60,
          rotation = 0,
          gid = 96,
          visible = true,
          properties = {}
        },
        {
          id = 74,
          name = "",
          class = "",
          shape = "rectangle",
          x = 520,
          y = 270,
          width = 100,
          height = 70,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 75,
          name = "",
          class = "",
          shape = "rectangle",
          x = 760,
          y = 270,
          width = 100,
          height = 70,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 76,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1000,
          y = 270,
          width = 100,
          height = 70,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 77,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1240,
          y = 270,
          width = 100,
          height = 70,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 78,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1480,
          y = 270,
          width = 100,
          height = 70,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 79,
          name = "",
          class = "",
          shape = "rectangle",
          x = 640,
          y = 350,
          width = 100,
          height = 70,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 81,
          name = "",
          class = "",
          shape = "rectangle",
          x = 880,
          y = 350,
          width = 100,
          height = 70,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 82,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1120,
          y = 350,
          width = 100,
          height = 70,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 83,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1360,
          y = 350,
          width = 100,
          height = 70,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 50,
          name = "entry",
          class = "",
          shape = "point",
          x = 40,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "entry1",
          class = "",
          shape = "point",
          x = 1440,
          y = 180,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 72,
          name = "entry2",
          class = "",
          shape = "point",
          x = 1440,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}