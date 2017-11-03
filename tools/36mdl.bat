mkdir "D:\Steam Games\steamapps\sourcemods\GillespiePass\materials\models\%1\"
copy "D:\Other Games\Betas\HL2\hl2\materials\models\%1\*" "D:\Steam Games\steamapps\sourcemods\GillespiePass\materials\models\%1\"
mdl36converter.exe -game "D:\Steam Games\steamapps\sourcemods\GilespiePass" "D:\Other Games\Betas\HL2\hl2\models\%1.mdl"
