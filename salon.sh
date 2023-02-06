#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU (){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?"
  AVAILABLE_SERVICES=$($PSQL "SELECT name FROM services ORDER BY service_id")
  if [[ -z $AVAILABLE_SERVICES ]]
  then
    # send to main menu
    MAIN_MENU "I could not find that service. What would you like today?"
  else

    # Get available services from database
    SERVICES=$($PSQL "SELECT service_id, name FROM services")

    # Read available services
    echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      # Display available services
      echo "$SERVICE_ID" | sed 's/|/) /'
    done
  fi

  read SERVICE_ID_SELECTED

  # if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then 
    MAIN_MENU "Please input a number"
  else
    echo $SERVICE_ID_SELECTED
     # Check service in database
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    echo "SERVICE_NAMESERVICE_NAME $SERVICE_NAME"
    # If service doesn't exist
    if [[ -z $SERVICE_NAME ]] 
    then
      # Return to home with message
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      case $SERVICE_ID_SELECTED in
        1) REGISTERATION_MENU $SERVICE_ID_SELECTED $SERVICE_NAME ;;
        2) REGISTERATION_MENU $SERVICE_ID_SELECTED $SERVICE_NAME ;;
        3) REGISTERATION_MENU $SERVICE_ID_SELECTED $SERVICE_NAME ;;
        4) REGISTERATION_MENU $SERVICE_ID_SELECTED $SERVICE_NAME ;;
        5) REGISTERATION_MENU $SERVICE_ID_SELECTED $SERVICE_NAME ;;
      *) MAIN_MENU "I could not find that service. What would you like today?" ;;
      esac
    fi
  fi
}

REGISTERATION_MENU() {
  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$2
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if not found
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi

  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # Ask for service time
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # Add appointment to database
  ADD_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VAlUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $ADD_APPOINTMENT_RESULT != "INSERT 0 1" ]]
  then
    MAIN_MENU "Could not schedule appointment, please schedule another service or try again later."
  else
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU
