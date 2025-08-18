#!/usr/bin/env bash

echo
echo "  SCRIPT CREATION UTILITY"
echo

read -p "~ ENTER SCRIPT NAME: " sas

sas="${sas%.sh}"

printf '#!/usr/bin/env bash\n\n\n' > "$sas.sh"

chmod +x "$sas.sh"

nvim +3 "$sas.sh"
