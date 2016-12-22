:: For running tests currently in development
:: (annotated by the "dev" tag
echo Starting
pybot -d Results -i dev --name B24_Tests Tests/*.robot
start Results/log.html

