
# Code Book - Getting and Cleaning Data Assignment 

This code book provide details of the variables that are provided in the tidy dataset that is produced by the R Script (run_analysis.R) in this repository. 

**"subject_ids"**      
 
Subject Identification Number (1:30) - ID number associated with the participant that completed the experiment. 
          
**"activity_type"**     

Type of Activity completed by the participants 

1. WALKING      
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING
       
#### Measurement Variables       

The measurements in this data set come from the accelerometer and gyroscope 3-axial raw signals time_accelerator_X|Y|Z_axial and time_gyroscope_X|Y|Z_axial. The time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time_body_accelerator_X|Y|Z_axial and time_gravity_accelerator_X|Y|Z_axial) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time_body_accelerator_jerk_X|Y|Z_axial and time_body_gyroscope_jerk_X|Y|Z_axial). Also, the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time_body_accelerator_magnitude, time_gravity_accelerator_magnitude, time_body_accelerator_jerk_magnitude, time_body_gyroscope_magnitude, time_body_gyroscope_jerk_magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency_body_accelerometer_X|Y|Z_axial, frequency_body_accelerometer_jerk_X|Y|Z_axial, frequency_body_gyroscope_X|Y|Z_axial, frequency_body_accelerometer_jerk_magnitude, frequency_body_gyroscope_magnitude, frequency_body_gyroscope_jerk_magnitude.

The mean and standard deviations of these measurements were calculated, and then the mean of these were calculated by subject and activty.

	**"time_body_accelerometer_mean_x_axial"**     
	**"time_body_accelerometer_mean_y_axial"**    
	**"time_body_accelerometer_mean_z_axial"**
**"time_body_accelerometer_std_x_axial"**                  
**"time_body_accelerometer_std_y_axial"**                  
**"time_body_accelerometer_std_z_axial"**                  
**"time_gravity_accelerometer_mean_x_axial"**     
**"time_gravity_accelerometer_mean_y_axial"**  
**"time_gravity_accelerometer_mean_z_axial"**               
**"time_gravity_accelerometer_std_x_axial"**
**"time_gravity_accelerometer_std_y_axial"**
**"time_gravity_accelerometer_std_z_axial"**
**"time_body_accelerometer_jerk_mean_x_axial"**
**"time_body_accelerometer_jerk_mean_y_axial"**
**"time_body_accelerometer_jerk_mean_z_axial"**
**"time_body_accelerometer_jerk_std_x_axial"** 
**"time_body_accelerometer_jerk_std_y_axial"** 
**"time_body_accelerometer_jerk_std_z_axial"** 
**"time_body_gyroscope_mean_x_axial"**
**"time_body_gyroscope_mean_y_axial"**
**"time_body_gyroscope_mean_z_axial"**
**"time_body_gyroscope_std_x_axial"**
**"time_body_gyroscope_std_y_axial"**
**"time_body_gyroscope_std_z_axial"**
**"time_body_gyroscope_jerk_mean_x_axial"**
**"time_body_gyroscope_jerk_mean_y_axial"**
**"time_body_gyroscope_jerk_mean_z_axial"**
**"time_body_gyroscope_jerk_std_x_axial"**
**"time_body_gyroscope_jerk_std_y_axial"**
**"time_body_gyroscope_jerk_std_z_axial"**
**"time_body_accelerometer_magnitude_mean"**
**"time_body_accelerometer_magnitude_std"**      
**"time_gravity_accelerometer_magnitude_mean"**            
**"time_gravity_accelerometer_magnitude_std"**             
**"time_body_accelerometer_jerk_magnitude_mean"**          
**"time_body_accelerometer_jerk_magnitude_std"**           
**"time_body_gyroscope_magnitude_mean"**                   
**"time_body_gyroscope_magnitude_std"**                    
**"time_body_gyroscope_jerk_magnitude_mean"**              
**"time_body_gyroscope_jerk_magnitude_std"**               
**"frequency_body_accelerometer_mean_x_axial"**          
**"frequency_body_accelerometer_mean_y_axial"**            
**"frequency_body_accelerometer_mean_z_axial"**            
**"frequency_body_accelerometer_std_x_axial"**             
**"frequency_body_accelerometer_std_y_axial"**             
**"frequency_body_accelerometer_std_z_axial"**             
**"frequency_body_accelerometer_jerk_mean_x_axial"**       
**"frequency_body_accelerometer_jerk_mean_y_axial"**       
**"frequency_body_accelerometer_jerk_mean_z_axial"**       
**"frequency_body_accelerometer_jerk_std_x_axial"**      
**"frequency_body_accelerometer_jerk_std_y_axial"**        
**"frequency_body_accelerometer_jerk_std_z_axial"**        
**"frequency_body_gyroscope_mean_x_axial"**                
**"frequency_body_gyroscope_mean_y_axial"**                
**"frequency_body_gyroscope_mean_z_axial"**                
**"frequency_body_gyroscope_std_x_axial"**                 
**"frequency_body_gyroscope_std_y_axial"**                 
**"frequency_body_gyroscope_std_z_axial"**                 
**"frequency_body_accelerometer_magnitude_mean"**          
**"frequency_body_accelerometer_magnitude_std"**           
**"frequency_body_body_accelerometer_jerk_magnitude_mean"**
**"frequency_body_body_accelerometer_jerk_magnitude_std"** 
**"frequency_body_body_gyroscope_magnitude_mean"**         
**"frequency_body_body_gyroscope_magnitude_std"**          
**"frequency_body_body_gyroscope_jerk_magnitude_mean"**    
**"frequency_body_body_gyroscope_jerk_magnitude_std"**    
