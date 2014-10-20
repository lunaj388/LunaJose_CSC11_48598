#include <iostream>
using namespace std;

int main(){
float hrswrkd,rtpay;
    
    cout<<"Enter number of hours worked and rate of pay"<<endl;
    cin>>hrswrkd>>rtpay;
    //Calculate gross pay
    float pay=rtpay*hrswrkd;
    if (hrswrkd<=20){
        cout<<"Your gross pay is $"<<pay<<endl<<endl;
    }
    //Calculate Overtime
    else if (hrswrkd>=21 && hrswrkd<=40){
        float ovrtime=(hrswrkd-20);
        float total=((hrswrkd-ovrtime)*(rtpay))+((ovrtime*rtpay)*1.5);
        cout<<"Your gross pay is $"<<total<<endl<<endl;
    }
    //Calculate Doubletime
    else if (hrswrkd>=41){
        float ovrtime=(hrswrkd-20);
        float dlbtime=(ovrtime-20);
        float total=((hrswrkd-ovrtime)*(rtpay))+((ovrtime*rtpay)*1.5)+
        (dlbtime*rtpay);
        cout<<"Your gross pay is $"<<total<<endl<<endl;
    }
}