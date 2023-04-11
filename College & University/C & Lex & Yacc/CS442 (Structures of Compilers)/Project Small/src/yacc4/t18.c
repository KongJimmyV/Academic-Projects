
bool x;
bool y;
bool z;

x = true;
y = false;
z = x && y;
print(z); printlines(1);
z = x || y;
print(z); printlines(1);
z = !x;
print(z); printlines(1);
z = !(x && y);
print(z); printlines(1);
z = !x || !y;
print(z); printlines(1);
z = !!x;
print(z); printlines(1);
