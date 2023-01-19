old_tempo = 0
reaper.gmem_attach("resync2")

function main()
   -- reaper.ClearConsole()
   tempo = tonumber(string.format("%.1f", reaper.gmem_read(0)))
   if (tempo > 10) and (reaper.GetPlayState() == 1)then
     if (old_tempo ~= tempo) then
       reaper.ShowConsoleMsg("not equal\n")
       reaper.SetTempoTimeSigMarker(0, -1, reaper.GetPlayPosition(), -1, -1, tempo, 0, 0, false)
       -- reaper.SetCurrentBPM(0, tempo, 1)
       old_tempo = tempo
    end
   end
   reaper.defer(main)
end

main()
