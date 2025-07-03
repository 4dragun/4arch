#!/usr/bin/env bash

echo && echo "󰲋 CREATING EXECUTABLE SCRIPT" && echo

read -p "Enter SCRIPT name: " sas
sas="${sas%.sh}"
printf '#!/usr/bin/env bash\n\n\n' > "$sas.sh"
chmod +x "$sas.sh"

nvim +3 "$sas.sh"
