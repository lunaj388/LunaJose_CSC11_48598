/* 
 * File:   main.cpp
 * Author: Jose Luna
 *
 * Created on October 20, 2014, 11:40 AM
 */

#include <iostream>
using namespace std;

int main(int argc, char** argv) {
    char sub;
    do{
    int hours;
    cout<<"Enter  your subscription package and number of hours accessed"<<endl;
    cin>>sub>>hours;
    
    //Package A
    if(sub=='a'&&hours<=11){
        cout<<"Your total is $30"<<endl;
    }
    else if (sub=='a'&&hours>=12&&hours<=22){
        int total = ((hours-11)*(3)+30);
        cout<<"Your total is $"<<total<<endl;
    }
    else if (sub=='a' && hours>=23){
        int total =((hours-22)*(6)+63);
        cout<<"Your total is $"<<total<<endl;
    }
    
    //Package B
    if(sub=='b'&&hours<=22){
        cout<<"Your total is $35"<<endl;
    }
    else if (sub=='b'&&hours>=23&&hours<=44){
        int total = ((hours-22)*(2)+35);
        cout<<"Your total is $"<<total<<endl;
    }
    else if (sub=='b' && hours>=45){
        int total =((hours-44)*(4)+79);
        cout<<"Your total is $"<<total<<endl;
    }
    
    //Package C
    if(sub=='c'&&hours<=33){
        cout<<"Your total is $40"<<endl;
    }
    else if (sub=='c'&&hours>=34&&hours<=66){
        int total = ((hours-33)*(1)+40);
        cout<<"Your total is $"<<total<<endl;
    }
    else if (sub=='c' && hours>=67){
        int total =((hours-66)*(2)+73);
        cout<<"Your total is $"<<total<<endl;
    }
    
    }while(sub!='d');
    return 0;
}

