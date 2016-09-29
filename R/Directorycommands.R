#Finds where packages get installed
.libPaths()

#Set where packages are installed
#         !!! Remember change "\" to "\\" or "/" !!!
.libPaths("C:/Users/Public/Temp")

#Finds where packages are found generally and for my user account
Sys.getenv("R_LIBS")
Sys.getenv("R_LIBS_USER")

#Sets the aforementioned paths
#Sys.setenv(R_LIBS = "...")  #usually not set, no need to change
Sys.setenv(R_LIBS_USER = "C:/Users/Public/Temp")