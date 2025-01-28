int main()  {
    int a = 123;
    int b = 100;
    int c = 256;
    printf( "val1: %d\n", a);
    printf( "val2: %d\n", b);
    printf( "val3: %d\n", c);
    passByVal(a,b,c);
    printf( "val1: %d\n", a);
    printf( "val2: %d\n", b);
    printf( "val3: %d\n", c);
    return 0;
}

void passByVal(int a, int b, int c) {
    printf("Passby Value fn\n\n");
    int t = a + b;
    t += c;
    printf("sum:%d\n", t);
    a += 1;
    b += 3;
    c += 5;
}