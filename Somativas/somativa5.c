#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int GERADOR = 0x00008005;
int MASK = 0x00008000;

int main(){
    unsigned char string[] = "Alo mundo";
    int tamanho = strlen(string);
    int crc = 0x00000000;
    for(int i = 0; i < tamanho; i++){
        crc ^= (int) ((string[i] << 8) & 0x0000FFFF);
        for(int j = 0; j < 8; j++){
            if((crc & MASK) == MASK){
                crc <<= 1;
                crc = crc ^ GERADOR;
            } else {
                crc <<= 1;
            }
            crc &= 0x0000FFFF;
        }
    }
    printf("0x%x\n", crc);
}
