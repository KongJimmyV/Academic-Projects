letter  [A-Za-z] 
digit   [0-9] 

%% 

begin               {return 0; } 
end                 {return 1;} 
{letter}{letter}*   {return 2;} 
{digit}{digit}*     {return 3;} 
\n                  {return 4;} 

%%

int main() {
    int x = yylex();
    while(x != 0) {
        x = yylex();
        printf("%d\n", x);
    }
}

int yywrap() {
    printf("all done\n");
    return 1;
    /* exit(0); */
}