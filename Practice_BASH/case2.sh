echo -e "enter some character \c"
read value
case $value in
    [a-z]) 
    echo "user entered $value a-z"
    ;;
    [A-Z]) 
    echo "user entered $value A-Z"
    ;;
    ? )          # ? for special caracter only
    echo "user entered $value a special character"
    ;;
    *) echo "unknown"
    ;;
esac
