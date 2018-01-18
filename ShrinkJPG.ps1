$argumentStem = "mogrify -resize 1920x1080 `""

function recurseDirectory($path)
{
  $fc = new-object -com scripting.filesystemobject
  $folder = $fc.getfolder($path)

  foreach ($i in $folder.files) {
  if ($i.size -gt 1537152 -And $i.type -eq "JPG File")
    {
	$arguments = $argumentStem + $i.path + "`""  
    Write-Output $arguments
    Start-Process -FilePath "C:\Program Files\ImageMagick-7.0.7-Q16\magick.exe" -ArgumentList $arguments -NoNewWindow
    }
  }

  foreach ($i in $folder.subfolders) {
    recurseDirectory($i.path)
  }
}


