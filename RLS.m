%Program to obtain Scheduling Table for graph of RLS algorithm
%
%Please Read the README.pdf file before running this file
%
%You must have run the command to add the path of TORSCHE Toolbox
%
%
%Author: Onkar 
%
%
%1)we try to create tasks in the TORSCHE toolbox corresponding to the 
%  nodes in the graph. 
%2)we create a precedence matrix, which gives the precedence between 
%  various nodes of the graph
%3) Specify the Problem- specifying the constraints and execute the problem
%   by passing the task-set as argument
%
%
%
%OUTPUT : Schedule TABLE for the graph given in report.
%         It also shows the dependencies between the tasks.
%         Observations are discussed in the report.
%

% First , we create 13 tasks corresponding to the 13 nodes in teh graph
t1 = task('t1',1);
t2 = task('t2',1);
t3 = task('t3',1);
t4 = task('t4',1);
t5 = task('t5',1);
t6 = task('t6',1);
t7 = task('t7',1);
t8 = task('t8',1);
t9 = task('t9',1);
t10 = task('t10',1);
t11 = task('t11',1);
t12 = task('t12',1);
t13 = task('t13',1);

% The precedents in the graph are shown in the precedence matrix
% Explained in the report
prec = [
        0 0 0 1 0 0 0 0 0 0 0 0 0
        0 0 0 1 1 0 0 0 0 0 0 0 0
        0 0 0 0 1 1 0 0 0 0 0 0 0
        0 0 0 0 0 0 1 1 0 0 0 0 0
        0 0 0 0 0 0 0 0 1 0 0 0 0
        0 0 0 0 0 0 0 0 1 1 0 0 0
        0 0 0 0 0 0 0 0 0 0 1 0 0
        0 0 0 0 0 0 0 0 0 0 1 1 0
        0 0 0 0 0 0 0 1 0 0 0 0 1
        0 0 0 0 0 0 0 0 0 0 0 0 1
        0 0 0 0 0 0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 0 0
    ];
% Specifying the problem to be solved
p = problem('P2|prec,pj=1|Cmax');
%
%All the tasks are coupled in to a Taskset
%Note : Precedence matrix is used to provide precedence between tasks 
T = taskset([t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13],prec);
TS= coffmangraham(T,p);
plot(TS);