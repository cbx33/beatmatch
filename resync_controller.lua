last_future_add = 0
reaper.gmem_attach("resync2")

function main()
   -- reaper.ClearConsole()
   tempo = tonumber(string.format("%.1f", reaper.gmem_read(0)))
   fut_tempo = tonumber(string.format("%.1f", reaper.gmem_read(1)))
   if (tempo > 10) and (reaper.GetPlayState() == 1)then
     if (first_run ~= 1) and (reaper.GetPlayPosition() < last_future_add) then
       reaper.ShowConsoleMsg("deleting old tempo\n")
       arb = reaper.FindTempoTimeSigMarker(0, reaper.gmem_read(2) + 1)
       reaper.DeleteTempoTimeSigMarker(0, arb)
     end
     reaper.ShowConsoleMsg("setting tempo\n")
     reaper.SetTempoTimeSigMarker(0, -1, reaper.GetPlayPosition(), -1, -1, tempo, 0, 0, false)
     reaper.SetTempoTimeSigMarker(0, -1, reaper.gmem_read(2), -1, -1, fut_tempo, 0, 0, false)
       -- reaper.SetCurrentBPM(0, tempo, 1)
     reaper.gmem_write(0, 0)
   end
   reaper.defer(main)
end

main()
