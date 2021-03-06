% create an identity matrix to represent the materials,
% 15 functionalities, and disposal (placeholder for now)
A_case=eye(16,16)
% input individual functionality and relevant material consumption
V1 = [-1;-1;-1;0;0;-1;-1;-1;-1;-0.35;-2.19;65700;0;0;0;1]
V2 = [-1;-1;-1;0;0;-1;-1;-1;-1;-0.73;-3.01;0;65700;0;0;1]
V3 = [-1;-1;-1;-1;-1;-1;-1;-1;-1;-0.8;-3.06;0;0;65700;0;1]
V4 = [-1;-1;-1;-1;-1;-1;-1;-1;-1;-1.05;-13.16;0;0;0;65700;1]

% disposal at end of life
Dis = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;-1]
% compile the functionalities
VT = cat(2,V1,V2,V3,V4,Dis) 
% replace the functionality related columns in the identity matrix%
A_case(:,12:16) = VT

% input each functionality utilization hours based on the survey
time=[53,96,25,96]/(53+96+25+96)
F1 = [0;0;0;0;0;0;0;0;0;0;0;65700*time(1);0;0;0;0]
F2 = [0;0;0;0;0;0;0;0;0;0;0;0;65700*time(2);0;0;0]
F3 = [0;0;0;0;0;0;0;0;0;0;0;0;0;65700*time(3);0;0]
F4 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;65700*time(4);0]
F_case = cat(2,F1,F2,F3,F4)
S_case = inv(A_case)*F_case
B_case = [23.1,1.9,2.7,1.3,1.9,0.5,0.1,4.81,0.2,0.453,0.453,0,0,0,0,0.1]
G_case = B_case*S_case

% input each functionality max utilization times
F1_full = [0;0;0;0;0;0;0;0;0;0;0;394200;0;0;0;0]
F2_full = [0;0;0;0;0;0;0;0;0;0;0;0;394200;0;0;0]
F3_full = [0;0;0;0;0;0;0;0;0;0;0;0;0;394200;0;0]
F4_full = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;394200;0]
F_case_full = cat(2,F1_full,F2_full,F3_full,F4_full)

S_case_full = inv(A_case)*F_case_full
G_case_full = B_case*S_case_full

power = (0.35+2.19)*time(1)+(0.73+3.01)*time(2)+(0.8+3.06)*time(3)+(1.05+13.16)*time(4)

G_case./G_case_full
FF=sum(G_case)/(power*0.453+ 35.98+0.1+0.6)
FF_allo=sum(G_case.*time)/(power*0.453+35.98+0.1+0.6)
