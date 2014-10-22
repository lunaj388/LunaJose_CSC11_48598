#include <iostream>
using namespace std;

int main(){
    //Determine the gross pay for employees
    //Straight time first 20 hours worked
    int hrs,pay;
    
    do{
    cout<<"Please input number of hours and rate of pay"<<endl;
    cin>>hrs>>pay;
    
    if (hrs>=0 && hrs<=20){
        int gross=hrs*pay;
        cout<<"Your gross pay is $"<<gross<<endl;
    }
    
    //Double time
    else if (hrs>=21 && hrs<=40){
        int ovr = hrs-20;
        int gross = ((hrs-ovr)*pay)+((ovr*pay)*2);
        cout<<"Your gross pay is $"<<gross<<endl;
    }
    
    //Triple time
    
    else if (hrs>=41 && hrs<=60){
        
        int reg =(20*pay);//regular pay 10 * 20 == 200
        int dbl = (20*pay)*(2);// double time 200 * 2 == 400
        
        int gross = ((reg+dbl) + (hrs-40)*(pay)*(3));
        cout<<"Your gross pay is $"<<gross<<endl;
    }
        
    }while (hrs>=0);
    
    return 0;
    
    
}