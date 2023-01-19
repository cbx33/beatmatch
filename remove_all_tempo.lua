num = reaper.CountTempoTimeSigMarkers(0)
for v = 0, num, 1 do
  reaper.DeleteTempoTimeSigMarker(0, v)
end
