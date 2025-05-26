void main() {
    char* video = (char*)0xb8000;
    char* str = "Hello World!";
    while(*str) {
        *video = *str;
        video += 2;
        str++;
    }
    while(1);
}