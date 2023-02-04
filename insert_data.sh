#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games CASCADE")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    OPPONENT_TEAM=$($PSQL "SELECT team_id FROM teams WHERE name = '${OPPONENT}'")
    echo $OPPONENT_TEAM
    if [[ -z $OPPONENT_TEAM ]]
    then
      INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')") 
    fi

    WINNER_TEAM=$($PSQL "SELECT team_id FROM teams WHERE name = '${WINNER}'")
    if [[ -z $WINNER_TEAM ]]
    then
      INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')") 
    fi

    # ===============INSERT TO THE GAMES================================
    OPPONENT_TEAM=$($PSQL "SELECT team_id FROM teams WHERE name = '${OPPONENT}'")
    WINNER_TEAM=$($PSQL "SELECT team_id FROM teams WHERE name = '${WINNER}'")
    if [[ ! -z $OPPONENT_TEAM &&  ! -z $WINNER_TEAM ]]
    then
      INSERT_GAME=$($PSQL "INSERT INTO games(winner_goals,opponent_goals,round,year,winner_id,opponent_id) VALUES($WINNER_GOALS,$OPPONENT_GOALS,'$ROUND',$YEAR, $WINNER_TEAM,$OPPONENT_TEAM)")
    fi
  fi
done

echo $($PSQL "SELECT * FROM teams")


