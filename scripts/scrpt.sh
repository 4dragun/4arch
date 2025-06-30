#!/usr/bin/env bash

read -p "Enter SCRIPT name: " sas

printf '#!/usr/bin/env bash\n\n\n' > "$sas.sh"
chmod +x $sas.sh
nvim +3 $sas.sh
