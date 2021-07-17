% create an identity matrix to represent the materials,
% 15 functionalities, and disposal (placeholder for now)
A_case=eye(20,20);
% input individual functionality and relevant material consumption
V1 = [-2; 0;0;-1;1000;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1]
V2 = [-177; -104;-6;-1;0;1000;0;0;0;0;0;0;0;0;0;0;0;0;0;1]
V3 = [-168; -104;-6;-1;0;0;1000;0;0;0;0;0;0;0;0;0;0;0;0;1]
V4 = [-164; -104;-6;-1;0;0;0;1000;0;0;0;0;0;0;0;0;0;0;0;1]
V5 = [-167; -104;-6;-1;0;0;0;0;1000;0;0;0;0;0;0;0;0;0;0;1]
V6 = [-166; -104;-6;-1;0;0;0;0;0;1000;0;0;0;0;0;0;0;0;0;1]
V7 = [-170; -104;-6;-1;0;0;0;0;0;0;1000;0;0;0;0;0;0;0;0;1]
V8 = [-165; -104;-6;-1;0;0;0;0;0;0;0;1000;0;0;0;0;0;0;0;1]
V9 = [-174; -104;-6;-1;0;0;0;0;0;0;0;0;1000;0;0;0;0;0;0;1]
V10 = [-169; -104;-6;-1;0;0;0;0;0;0;0;0;0;1000;0;0;0;0;0;1]
V11 = [0; -3;0;-1;0;0;0;0;0;0;0;0;0;0;1000;0;0;0;0;1]
V12 = [-1; 0;0;-1;0;0;0;0;0;0;0;0;0;0;0;1000;0;0;0;1]
V13 = [-169; -104;-6;-1;0;0;0;0;0;0;0;0;0;0;0;0;1000;0;0;1]
V14 = [-169; -104;-6;-1;0;0;0;0;0;0;0;0;0;0;0;0;0;1000;0;1]
V15 = [-176; -104;-6;-1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1000;1]

% disposal at end of life
Dis = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;-1]
% compile the functionalities
VT = cat(2,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,Dis) 
% replace the functionality related columns in the identity matrix
A_case(:,5:20) = VT

% input each functionality utilization times based on user survey(round up)
F1 = [0;0;0;0;39.9;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0]
F2 = [0;0;0;0;0;110.5;0;0;0;0;0;0;0;0;0;0;0;0;0;0]
F3 = [0;0;0;0;0;0;63.2;0;0;0;0;0;0;0;0;0;0;0;0;0]
F4 = [0;0;0;0;0;0;0;32.5;0;0;0;0;0;0;0;0;0;0;0;0]
F5 = [0;0;0;0;0;0;0;0;69.6;0;0;0;0;0;0;0;0;0;0;0]
F6 = [0;0;0;0;0;0;0;0;0;76.9;0;0;0;0;0;0;0;0;0;0]
F7 = [0;0;0;0;0;0;0;0;0;0;26.8;0;0;0;0;0;0;0;0;0]
F8 = [0;0;0;0;0;0;0;0;0;0;0;29.7;0;0;0;0;0;0;0;0]
F9 = [0;0;0;0;0;0;0;0;0;0;0;0;87.2;0;0;0;0;0;0;0]
F10 = [0;0;0;0;0;0;0;0;0;0;0;0;0;90.7;0;0;0;0;0;0]
F11 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;43.1;0;0;0;0;0]
F12 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;128.3;0;0;0;0]
F13 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;56.7;0;0;0]
F14 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;33.8;0;0]
F15 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;11.11;0]
F_case = cat(2,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15)

S_case = inv(A_case)*F_case
B_case = [4.76,7.8,9.15,0.4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.1]
G_case = B_case*S_case

% input each functionality max utilization times
F1_full = [0;0;0;0;1000;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0]
F2_full = [0;0;0;0;0;1000;0;0;0;0;0;0;0;0;0;0;0;0;0;0]
F3_full = [0;0;0;0;0;0;1000;0;0;0;0;0;0;0;0;0;0;0;0;0]
F4_full = [0;0;0;0;0;0;0;1000;0;0;0;0;0;0;0;0;0;0;0;0]
F5_full = [0;0;0;0;0;0;0;0;1000;0;0;0;0;0;0;0;0;0;0;0]
F6_full = [0;0;0;0;0;0;0;0;0;1000;0;0;0;0;0;0;0;0;0;0]
F7_full = [0;0;0;0;0;0;0;0;0;0;1000;0;0;0;0;0;0;0;0;0]
F8_full = [0;0;0;0;0;0;0;0;0;0;0;1000;0;0;0;0;0;0;0;0]
F9_full = [0;0;0;0;0;0;0;0;0;0;0;0;1000;0;0;0;0;0;0;0]
F10_full = [0;0;0;0;0;0;0;0;0;0;0;0;0;1000;0;0;0;0;0;0]
F11_full = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;1000;0;0;0;0;0]
F12_full = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1000;0;0;0;0]
F13_full = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1000;0;0;0]
F14_full = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1000;0;0]
F15_full = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1000;0]
F_case_full = cat(2,F1_full,F2_full,F3_full,F4_full,F5_full,F6_full,F7_full,F8_full,F9_full,F10_full,F11_full,F12_full,F13_full,F14_full,F15_full)

S_case = inv(A_case)*F_case_full
B_case = [4.76,7.8,9.15,0.4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.1]
G_case_full = B_case*S_case
FF=sum(G_case_full)/(255*4.76+107*7.8+6*9.15+0.4)
time = [39.9, 110.5, 63.2, 32.5, 69.6, 76.9, 26.8, 29.7, 87.2, 90.7, 43.1, 128.3, 56.7, 33.8, 11.11]
time = time/sum(time)
FF_allo=sum(G_case_full.*time)/2103.7
