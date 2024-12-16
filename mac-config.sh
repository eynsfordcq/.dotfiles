#!/bin/bash

# home and end behavior like windows
mkdir -p $HOME/Library/KeyBindings
echo '{
"\UF729" = "moveToBeginningOfLine:"; /* Home */
"\UF72B" = "moveToEndOfLine:"; /* End */
"$\UF729" = "moveToBeginningOfLineAndModifySelection:"; /* Shift + Home */
"$\UF72B" = "moveToEndOfLineAndModifySelection:"; /* Shift + End */
}' > $HOME/Library/KeyBindings/DefaultKeyBinding.dict