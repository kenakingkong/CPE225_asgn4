 ; Should I be your friend?

        .ORIG x3300

Q1      .STRINGZ "\nHow frequently do you nap?\n 1 - Once a day\n 2 - When I feel like it\n 3 - I have no control\n 4 - Never\n "
Q1Answ  .FILL   #5
        .FILL   #8
        .FILL   #10
        .FILL   #2

Q2      .STRINGZ "\nWhich form of social media do you use the most?\n 1 - Snapchat\n 2 - Facebook\n 3 - Instagram\n 4 - Twitter\n"
Q2Answ  .FILL   #8
        .FILL   #2
        .FILL   #10
        .FILL   #5

Q3      .STRINGZ "\nWhich dare would you choose?\n 1 - skinny dip in a pool\n 2 - lick my big toe\n 3 - wear ALL your clothes inside out\n 4 - drool everytime you talk to someone for a day\n"
Q3Answ  .FILL   #10
        .FILL   #8
        .FILL   #2
        .FILL   #5

RESULT1 .STRINGZ "\nDon't talk to me"
RESULT2 .STRINGZ "\nWe could never be more than acquaintances"
RESULT3 .STRINGZ "\nPlease be my friend"
RESULT4 .STRINGZ "\nWe are friend soulmates"

        .END
