# GearBox: Exploiting Deadline-Malleability in Cloud-based Batch Processing Systems

A batch processing cluster job scheduler. 

## Reference
You can find a detailed description of the scheduler in the paper below:

[Exploiting Time-Malleability in Cloud-based Batch Processing Systems](http://www.doc.ic.ac.uk/~lm111/articles/mai13exploiting.pdf)  
 Luo Mai, Evangelia Kalyvianaki, Paolo Costa  
 7th ACM SIGOPS Workshop on Large-Scale Distributed Systems and Middleware (LADIS'13) co-located with SOSP'13

## Prerequisites for the GearBox scheduler
1. boost library 1.53+
2. cplex 12.4+ [(free academic licence)](https://www.ibm.com/developerworks/community/blogs/jfp/entry/cplex_studio_in_ibm_academic_initiative?lang=en)

After installing these two libraries, change the corresponding directories in the resources/MakeFile so that the g++ compiler knows the correct paths to the libraries.

## Scheduler configuration

Configuration options

* policy: only MIP is available this moment. LP and Heuristic can be added later.
* jobSizeError: the maximum allowable error in a slot allocation.
* slotCount: the total number of available slots
* timeSliceLength: the length of a schedule time slice.
* solutionError (percentages): a stopping criteria for the cplex program
* computationTimeLimit (seconds): a stopping criteria for the cpelx program

example configuration file: example/config

## Providing a "job_status" file to the scheudler
A "job_status" file contains the status of the running jobs and the new arrival jobs. 
The scheduler computes a resource allocation plan depending on the current status of all the jobs.
A user needs to specify the status of all jobs in the following manner where each line represnets a single job and multiple jobs can be specified line by line.

**CSV Format**

	jobId, jobSize, jobStartTime, pfBegin, pfEnd, pfSlope, pfIntercept

* jobId: the unique identifier for a job
* jobSize: the size of a job, e.g., the number of required hadoop slots
* jobStartTime: job starting time in a standard time unit (e.g., second, minute, hour...)
* pfBegin: the begining of the x-axis (deadline dimension) of the pricing function. This is the hard deadline.
* pfEnd: the end of the x-axis of the pricing function. This is the soft deadline
* pfSlope: the slope of the pricing function
* pfIntercept: the intercept of the pricing function on the y-axis (price dimension)

More details about the pricing function, scheduling problem formulation can be found in the paper.

example configuration file: example/job_status

## Running the scheduler

This can be easily inferred from the main.cpp
A simple example is given in the resources/example folder to give a sense how the scheduler works.

## Scheduler output

The output of the scheduler contains the plan for each job over a certain duration. 
Each line represents the schedule of a single job.

**CSV format**

	jobId, #slots in the time 1, #slots in the time 2, ......., #slots in the time N

example configuration file: example/out

# Copyright
Contact: luo.mai.cs@gmail.com
