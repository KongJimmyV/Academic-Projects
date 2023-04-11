
void printBool(bool a) {
    print(a); printspaces(4);
}


int x[] = {1,2,3,4};
int y[] = {5,3,3,2};
int i;
bool z;
for (i = 0; i < 4; i++) {
    z = x[i] == y[i];
    printBool(z);
}
printlines(2);
for (i = 0; i < 4; i++) {
    z = x[i] <= y[i];
    printBool(z);
}
printlines(2);
for (i = 0; i < 4; i++) {
    z = x[i] >= 3 &&  y[i] <= 5;
    printBool(z);
}
printlines(2);
for (i = 0; i < 4; i++) {
    z = x[i] > 3 ||  !(y[i] >= 5);
    printBool(z);
}
printlines(1);


