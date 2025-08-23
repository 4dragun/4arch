#!/usr/bin/env bash

echo -e "\n  SCRIPT CREATION UTILITY\n"

read -p "~ ENTER SCRIPT NAME: " sas

sas="${sas%.sh}"

printf '#!/usr/bin/env bash\n\n\n' > "$sas.sh"

chmod +x "$sas.sh"

nvim +3 "$sas.sh"
