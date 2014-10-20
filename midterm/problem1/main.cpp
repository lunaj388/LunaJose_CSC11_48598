/* 
 * File:   main.cpp
 * Author: Jose Luna
 *
 * Created on October 20, 2014, 9:24 AM
 */

#include <iostream>
using namespace std;

int main(int argc, char** argv) {

//Declare Variables
    float pckg,hours;
    cout<<"Enter subscription package"<<endl<<endl;
    cout<<"Enter 1 for Package 1,2 for Package 2, or 3 for Package 3"<<endl<<endl;
    cin>>pckg;
    cout<<"Enter number of hours accessed"<<endl<<endl;
    cin>>hours;
    //Calculate price for package 1
    if (pckg==1&&hours<=11){
        cout<<"Your total is $29.95"<<endl<<endl;
    }
    else if (pckg==1&&hours>=12&&hours<=22){
        float addhrs=(hours-11);
        float total=(addhrs*2.25)+29.95;
        cout<<"Your total is $"<<total<<endl<<endl;
    }
    else if (pckg==1&&hours>=23){
        float addhrs=(hours-22);
        float total=(addhrs*4.95)+54.70;
        cout<<"Your total is $"<<total<<endl<<endl;
    }
    
    //Calculate Package 2
    if (pckg==2&&hours<=22){
        cout<<"Your total is $34.95"<<endl<<endl;
    }
    else if (pckg==2&&hours>=23&&hours<=33){
        float addhrs=(hours-22);
        float total=(addhrs*1.25)+34.95;
        cout<<"Your total is $"<<total<<endl<<endl;
    }
    else if (pckg==2&&hours>=34){
        float addhrs=(hours-33);
        float total=(addhrs*2.25)+109.15;
        cout<<"Your total is $"<<total<<endl<<endl;
    }
    //Calculate Package 3
    if (pckg==3)
            cout<<"Your total is $42.95"<<endl<<endl;
}


