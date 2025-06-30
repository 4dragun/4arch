#!/usr/bin/env bash

read -p "Enter SCRIPT name: " sas

printf '#!/usr/bin/env bash\n\n\n' > "$sas"
chmod +x $sas
nvim +3 $sas
