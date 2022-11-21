a.Simulation of FCFS CPU Scheduling algorithm.#include<iostream>

using namespace std;

int main() {
  int n, bt[20], wt[20], tat[20], avwt = 0, avtat = 0, i, j;
  cout << "Enter total number of processes (max 20): ";
  cin >> n;
  cout << "\nEnter Process brust time: \n";
  for (i = 0; i < n; i++) {
    cout << "P[" << i + 1 << "]: ";
    cin >> bt[i];
  }
  wt[0] = 0;
  for (i = 1; i < n; i++) {
    wt[i] = 0;
    for (j = 0; j < i; j++) {
      wt[i] += bt[j];
    }
  }
  cout << "\nProcess\tBrust time\tWating time\tTurn around time";
  for (i = 0; i < n; i++) {
    tat[i] = bt[i] + wt[i];
    avwt += wt[i];
    avtat += tat[i];
    cout << "\np[" << i + 1 << "]" << "\t\t" << bt[i] << "\t\t" << wt[i] << "\t\t" << tat[i];
  }
  avwt /= i;
  avtat /= i;
  cout << "\nAverage waiting time = " << avwt;
  cout << "\nAverage turn around time = " << avtat;
}

b.Simulation of SJF CPU Scheduling algorithm.#include <stdio.h> int main() {

int bt[20], p[20], wt[20], tat[20], i, j, n, total = 0, pos, temp;
float avg_wt, avg_tat;
printf("Enter number of process: ");
scanf("%d", & n);
printf("\nEnter Burst Time:\n");
for (i = 0; i < n; i++) {
  printf("p%d:", i + 1);
  scanf("%d", & bt[i]);
  p[i] = i + 1; // contains process number 
}
// sorting burst time in ascending order using selection sort     for (i = 0; i < n; i++) 
{
  pos = i;
  for (j = i + 1; j < n; j++) {
    if (bt[j] < bt[pos]) pos = j;
  }
  temp = bt[i];
  bt[i] = bt[pos];
  bt[pos] = temp;
  temp = p[i];
  p[i] = p[pos];
  p[pos] = temp;
}
wt[0] = 0; // waiting time for first process will be zero 
// calculate waiting time     for (i = 1; i < n; i++) 
{
  wt[i] = 0;
  for (j = 0; j < i; j++) wt[i] += bt[j];
  total += wt[i];
}
avg_wt = (float) total / n; // average waiting time     total = 0; 
printf("\nProcess\t Burst Time \tWaiting Time\tTurnaround Time");
for (i = 0; i < n; i++) {
  tat[i] = bt[i] + wt[i]; // calculate turnaround time         total += tat[i]; 
  printf("\np%d\t\t %d\t\t %d\t\t\t%d", p[i], bt[i], wt[i], tat[i]);
}
avg_tat = (float) total / n; // average turnaround time     printf("\n\nAverage Waiting Time=%f", avg_wt); 
printf("\nAverage Turnaround Time=%f\n", avg_tat);
return 0;
}



a. Simulation of Round Robin CPU Scheduling algorithm. 

#include <iostream> 
using namespace std; 

struct process

{
  int no;
  int at, et, wt, tt;
  int tet;
  int t;
};
int main() {
  process p[99];
  int i, j, k;
  cout << "\n Enter No of Processes:";
  int np;
  cin >> np;
  for (i = 0; i < np; i++) {
    cout << "\n Enter Execution time of process " << i + 1 << ":";
    cin >> p[i].et;
    p[i].tet = p[i].et;
    p[i].at = p[i].t = p[i].tt = p[i].wt = 0;
    p[i].no = i + 1;
  }
  cout << "\n Enter Time Quantum:";
  int q;
  cin >> q;
  cout << "\n Entered Data";
  cout << "\nProcess ExecutionTime";
  for (i = 0; i < np; i++) {
    cout << "\n " << p[i].no << "\t" << p[i].et;
  }
  int totaltime = 0;
  for (i = 0; i < np; i++) {
    totaltime += p[i].et;
  }
  i = 0;
  k = 0;
  int rrg[99];
  for (j = 0; j < totaltime; j++) {
    if ((k == 0) && (p[i].et != 0)) {
      p[i].wt = j;
      if ((p[i].t != 0)) {
        p[i].wt -= q * p[i].t;
      }
    }
    if ((p[i].et != 0) && (k != q)) {
      rrg[j] = p[i].no;
      p[i].et -= 1;
      k++;
    } else {
      if ((k == q) && (p[i].et != 0)) {
        p[i].t += 1;
      }
      i = i + 1;
      if (i == np) {
        i = 0;
      }
      k = 0;
      j = j - 1;
    }
  }
  int twt = 0;
  int ttt = 0;
  cout << "\n \t\tResult Of Round Robin";
  cout << "\n Processes\tExecution Time\tWaitng Time\tTurn around Time";
  for (i = 0; i < np; i++) {
    p[i].tt = p[i].wt + p[i].tet;
    ttt += p[i].tt;
    twt += p[i].wt;
    cout << "\n " << p[i].no << "\t" <<
      "\t\t" << p[i].tet << "\t" << p[i].wt << "\t\t" << p[i].tt;
  }
  cout << "\n Average Waiting Time:" << (float) twt / np;
  cout << "\n Average Turn Around Time:" << (float) ttt / np;
  return 0;
}



b.Simulation of Priority based CPU Scheduling algorithm.

#include<iostream> using namespace std; int main() { int bt[20],p[20],wt[20],tat[20],pr[20],i,j,n,total=0,pos,temp,avg_wt,avg_tat; cout<<"Enter Total Number of Process:"; cin>>n;

cout << "\nEnter Burst Time and Priority\n";
for (i = 0; i < n; i++) {
  cout << "\nP[" << i + 1 << "]\n";
  cout << "Burst Time:";
  cin >> bt[i];
  cout << "Priority:";
  cin >> pr[i];
  p[i] = i + 1;
  //contains process number 
}
//sorting burst time, priority and process number in ascending order using selection sort for (i=0;i<n;i++) { pos=i; 
for (j = i + 1; j < n; j++) {
  if (pr[j] < pr[pos])
    pos = j;
}
temp = pr[i];
pr[i] = pr[pos];
pr[pos] = temp;
temp = bt[i];
bt[i] = bt[pos];
bt[pos] = temp;
temp = p[i];
p[i] = p[pos];
p[pos] = temp;
}
wt[0] = 0;
//waiting time for first process is zero 
//calculate waiting time for (i=1;i<n;i++) { wt[i]=0; for (j=0;j<i;j++) wt[i]+=bt[j]; 
total += wt[i];
}
avg_wt = total / n; //average waiting time total=0; 
cout << "\nProcess\t 	Burst Time 	\tWaiting Time\tTurnaround Time";
for (i = 0; i < n; i++) {
  tat[i] = bt[i] + wt[i]; //calculate turnaround time 
  total += tat[i];
  cout << "\nP[" << p[i] << "]\t\t " << bt[i] << "\t\t 
  "<<wt[i]<<"\
  t\ t\ t "<<tat[i]; 
}
avg_tat = total / n; //average turnaround time cout<<"\nAverage Waiting Time="<<avg_wt; cout<<"\nAverage Turnaround Time="<<avg_tat; return 0; 
}
