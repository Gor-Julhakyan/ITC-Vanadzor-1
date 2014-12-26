#!/bin/bash

#Global variables 
DECK=52
CARDS_IN_SUIT=13
SUIT=4
TOTAL_DECK=104
 
#local variables
declare -a deck
declare -a shuf_deck
declare -a total_deck
declare -a suit
declare -a card_number
declare  cards_state  #picked:1 or unpicked:0
card_number=(2 3 4 5 6 7 8 9 10 J Q K A)   #cards of one suit
suit=(C D H S)
cards_state=0

initialize_deck(){
    i=0
    for((j=0;j<CARDS_IN_SUIT;j++))
         do
           for((k=0;k<SUIT;k++))
              do
                     deck[i]="${suit[k]} ${card_number[j]}"
                    # echo -e "\t${deck[i]}"
                     let ++i
                   
              done

         done
}
initialize_deck

create_total_deck(){
    for((i=0,j=0;i<$TOTAL_DECK;i++,j++))
    do
        if [ $j == ${DECK} ]
        then
            j=0
        fi
        total_deck[i]=${deck[j]}
       # echo "$i    ${total_deck[i]}"
    done
}
create_total_deck

print_table(){
    echo -e "\t____\t_____\t_____\t_____\t_____\t_____\t_____\t_____\t_____\t_____"
    echo -e "\t"${deck[1]}
}
#print_table

shuffle_total_deck(){
   shuf_deck=$(shuf -e ${total_deck[@]})
    #echo "${total_deck[@]}"

}
shuffle_total_deck
for((i=0;i<104;i++))
do
    echo "$i  ${shuf_deck[i]}"
done