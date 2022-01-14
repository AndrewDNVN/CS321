#include <iostream> 
#include <iomanip>
using namespace std; 

// horners algo 
double horner(int poly[], int n, double x) 
{ 
    double result = poly[0]; // Initialize result 

    // Evaluate value of polynomial using Horner's method 
    for (int i=1; i < n; i++) 
        result = result*x + poly[i]; 

    return result; 
} 

// Driver program 
int main() 
{ 
    int poly[] = {1, -18, 144, -672, 2016, -4032, 5376, -4608, 2304, -512}; 
    double x = 3.28; 
    int n = sizeof(poly)/sizeof(poly[0]); 
    double out = horner(poly, n, x); 

    // needed for webwork requirements
    cout << setprecision(12) << out << endl;

    return 0; 
} 