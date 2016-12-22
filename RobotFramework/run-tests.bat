::Runs all the tests
echo Starting
pybot -d Results --name B24_Tests Tests/*.robot
start Results/log.html