################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Function.cpp \
../src/Job.cpp \
../src/JobStatusReader.cpp \
../src/Scheduler.cpp 

OBJS += \
./src/Function.o \
./src/Job.o \
./src/JobStatusReader.o \
./src/Scheduler.o 

CPP_DEPS += \
./src/Function.d \
./src/Job.d \
./src/JobStatusReader.d \
./src/Scheduler.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/opt/ibm/ILOG/CPLEX_Studio124/opl/include -I/opt/ibm/ILOG/CPLEX_Studio124/cplex/include -I/opt/ibm/ILOG/CPLEX_Studio124/concert/include -I/home/parallels/Development/boost_1_53_0 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


