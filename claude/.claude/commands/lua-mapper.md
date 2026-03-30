---
description: Generate a Lua Edison script for EDI mapping based on user instructions
argument-hint: Paste the mapping requirements (e.g. "set ISA06 to the SCAC from the 204 tender")
---

Generate a Lua Edison script for the Bitfreighter EDI mapping system based on the user's instructions: $ARGUMENTS

# Lua Edison Overview

Lua Edison is a sandboxed Lua scripting environment for EDI transformations. Scripts operate on the full EDI document encoded in Edison format (hierarchical ISA/GS/ST structure). The global entry point is `ISALoop`.

# Key Rules

- LuaEdison blocks MUST be placed at the MapInterchanges level in the mapper JSON (not inside MapTransactions) because they need the full ISA/GS/ST envelope structure.
- The script must NOT use `return segments` — that is old Lua mapper syntax. Lua Edison modifies the edison table in-place.
- Only segments that exist in the EDI spec for the transaction type can be used. For example, NTE does not exist in a 210 — use N9 for debug output instead.
- Use the function-per-tx-type pattern shown below.
- **Do NOT use `ipairs` with `s5_loop:set(nil)` to remove S5 loops** — this pattern causes L0 segments to silently disappear from LX loops. Use `st_loop.S5Loop:set({})` to clear all S5 loops instead.
- **Use `:each()` chaining to iterate sub-loops**, not `ipairs`. For example, to iterate LX loops and access L5: `for lx_loop, l5 in st_loop.LXLoop.L5:each() do`. Using `ipairs(st_loop.LXLoop)` returns Edison reference objects, not usable values.
- **Inserting N1Loops**: Use `st_loop.N1Loop:set(data)` first to set bulk entries, then `table.insert(st_loop.N1Loop, position, entry)` to add hardcoded entries at specific positions. Building a full table and passing to `:set()` may silently drop entries that lack N3/N4 sub-segments.
- **Debug output**: Use `table.insert(st_loop.N9, {"DEBUG", value})` for debug. Never output raw ISA values — they contain bytes that crash the server.
- **Non-breaking spaces in sample EDI**: If ISA element comparisons fail unexpectedly, the sample EDI may contain non-breaking spaces (0xC2A0) introduced by Safari when copying. Use Chrome instead of Safari to copy EDI data. The Edison system itself does NOT introduce non-breaking spaces — `%s` gsub is sufficient for stripping ISA padding.

# Script Structure

Always use this pattern:

```lua
function map_210(isa_loop, gs_loop, st_loop)
  -- mapping logic here
end

for isa_loop, gs_loop, st_loop in ISALoop.GSLoop.STLoop:each() do
  if st_loop.ST[01]:get() == "210" then
    map_210(isa_loop, gs_loop, st_loop)
  end
end
```

# Available Functions

## Getting values
```lua
st_loop.B3[03]:get()       -- get element 3 of B3 segment
st_loop.ST[01]:get()       -- get transaction type
isa_loop.ISA[06]:get()     -- get ISA element
gs_loop.GS[02]:get()       -- get GS element
```

## Setting values
```lua
st_loop.B3[11]:set(value)                          -- set element
isa_loop.ISA[06]:set(string.pad_trailing(val, 15)) -- ISA fields must be padded to 15 chars
gs_loop.GS[02]:set(value)                          -- GS fields are variable length
```

## Loading tender/load info
```lua
local load = st_loop:load()
```
This calls `db.get_load_info` under the hood and returns a table with:
- `load.shipment_id` — shipment ID number
- `load.scac` — SCAC code (from B202 on the original 204 tender)
- `load.status` — load status
- `load.payment_method` — payment method
- `load.total_charge` — total charge
- `load.carrier_reference_number` — carrier ref number
- `load.weight`, `load.weight_qualifier`, `load.weight_unit_code`
- `load.volume`, `load.volume_qualifier`
- `load.lading_quantity`
- `load.pieces`
- `load.equipment` — table with `.number`, `.code`, `.length_in_inches`, `.type`
- `load.stops` — list of stops, each with `.number`, `.reason_code`, `.parties`, `.reference_numbers`, `.orders`, `.weight`, `.volume`, etc.
- `load.parties` — list of parties with `.name`, `.entity_identifier_code`, `.identification_code`, `.city`, `.state`, `.postal_code`, etc.
- `load.reference_numbers` — list with `.qualifier`, `.value`, `.description`
- `load.orders` — list with `.identification_number`, `.purchase_order_number`, `.quantity`, `.weight`, `.volume`
- `load.tenders` — list with `.purpose`, `.responded`
- `load.truck_prices` — list with `.strategy`, `.price`
- `load.accepted_by_user` — table with `.name`, `.email` (or nil)

## Inserting segments
```lua
st_loop.N9:insert({"BM", "12345"})  -- insert an N9 segment
```

## Iterating
```lua
for _, ref in ipairs(load.reference_numbers) do
  if ref.qualifier == "PO" then
    -- do something
  end
end

for _, stop in ipairs(load.stops) do
  -- process each stop
end
```

## Generating segments from load data
```lua
local n1_loops = generate.n1_loops_from_parties(load.parties)
st_loop.N1Loop:set(n1_loops)
```

## String helpers
```lua
string.pad_trailing(str, length)      -- pad with spaces
string.pad_trailing(str, length, "0") -- pad with custom char
string.pad_leading(str, length)
string.split(str, separator)
```

## Table helpers
```lua
table.contains(tbl, value)
table.deep_copy(tbl)
table.uniq(tbl)
table.equal(tbl1, tbl2)
default(var, fallback)  -- returns var if truthy, fallback or "" otherwise
```

## Other edison operations
```lua
st_loop.L11:set({})                    -- clear all L11 segments
edison.convert(paths, "5010")          -- convert transaction version
st_loop.G62:convert_timezone({"ET"})   -- convert timezones
```

# Common Patterns

## SCAC from tender
```lua
local load = st_loop:load()
if load and load.scac and load.scac ~= "" then
  isa_loop.ISA[06]:set(string.pad_trailing(load.scac, 15))
  gs_loop.GS[02]:set(load.scac)
  st_loop.B3[11]:set(load.scac)
  st_loop.R3[01]:set(load.scac)
end
```

## Rebuild reference numbers from load
```lua
st_loop.L11:set({})
for _, ref in ipairs(load.reference_numbers) do
  st_loop.L11:insert({ref.value, ref.qualifier})
end
```

## Rebuild parties from load
```lua
local n1_loops = generate.n1_loops_from_parties(load.parties)
st_loop.N1Loop:set(n1_loops)
```

## Debug output (use N9 not NTE for 210s)
```lua
table.insert(st_loop.N9, {"DEBUG", some_value})
```

## Reading ISA element values for comparison
```lua
-- ISA elements are padded to 15 chars with spaces. Strip spaces before comparing.
local isa08 = string.gsub(isa_loop.ISA[08]:get(), '%s', '')
if isa08 == "AMRIZE" then
  -- do something
end
```

## Moving N1Loops from S5 loops to header
```lua
local s5_n1_loops = {}
for s5_loop in st_loop.S5Loop:each() do
  local n1_data = s5_loop.N1Loop:get()
  if n1_data then
    for _, n1_entry in ipairs(n1_data) do
      table.insert(s5_n1_loops, n1_entry)
    end
  end
end

st_loop.S5Loop:set({})
st_loop.N1Loop:set(s5_n1_loops)

-- Insert hardcoded N1 loops AFTER :set(), using table.insert with position
table.insert(st_loop.N1Loop, 1, {
  N1 = {"SE", "COMPANY NAME", "2", "SCAC"}
})
```

## Modifying segments within LX loops
```lua
-- Use :each() chaining through L5 to get both lx_loop context and L5 value
for lx_loop, l5 in st_loop.LXLoop.L5:each() do
  local l5_desc = l5[02]:get()
  if l5_desc == "Freight - flat" then
    lx_loop.L0[02]:set("374")
    lx_loop.L0[03]:set("DM")
  end
end
```

## Filtering N9 segments (rebuild approach)
```lua
-- Collect keepers, clear, re-insert. Safer than ipairs + set(nil).
local kept_n9s = {}
for n9 in st_loop.N9:each() do
  local qual = n9[01]:get()
  if qual ~= "ZZ" and qual ~= "BM" then
    table.insert(kept_n9s, {qual, n9[02]:get()})
  end
end
st_loop.N9:set({})
for _, n9_data in ipairs(kept_n9s) do
  table.insert(st_loop.N9, n9_data)
end
```

## Collecting N9 values from S5 sub-loops
```lua
for s5_loop, n9 in st_loop.S5Loop.N9:each() do
  if n9[01]:get() == "PO" then
    -- use n9[02]:get() value
  end
end
```

# Output Format

Output ONLY the Lua Edison script. Do not include the JSON block wrapper — the user will paste the script into the mapper UI. Add a brief comment at the top describing what the script does.

# Self-Improvement

After the user has tested the generated script and confirmed it works (or reported issues), review the conversation for any hiccups, gotchas, or new learnings. Then update THIS file (`/Users/johnmarks/.claude/commands/lua-mapper.md`) with the new knowledge:

- Add new gotchas to the "Key Rules" section
- Add new patterns to the "Common Patterns" section
- Add new fields to the load info documentation if any were discovered
- Add new segment-availability notes (like "NTE doesn't exist in 210")
- Add any new helper functions or syntax discoveries

Tell the user what you learned and what you added to the command for next time.
