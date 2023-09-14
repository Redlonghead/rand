#!/bin/bash
for NAME in bob sue mary frank jane lisa jason
do
mail -s "Your new project schedule" < newschedule $NAME
echo "$NAME was emailed successfully:"
done