
void printBool(bool a) {
    print(a); printspaces(4);
}


bool x[] = {true, true, false, false};
bool y[] = {true, false, true, false};
int i;
for (i = 0; i < 4; i++) {
    printBool(x[i]);
    printBool(y[i]);
    printBool(x[i] && y[i]);
    printlines(1);
}
printf("\n");
for (i = 0; i < 4; i++) {
    printBool(x[i]);
    printBool(y[i]);
    printBool(x[i] || y[i]);
    printlines(1);
}
printf("\n");
 for (i = 0; i < 4; i++) {
     printBool(x[i]);
     printBool(y[i]);
     printBool(!(x[i] && !y[i]));
     printlines(1);
 }


