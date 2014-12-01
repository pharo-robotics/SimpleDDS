A ROS response is compound of 3 elements described below: statusCode, statusMessage, and value.

    statusCode (Integer): An integer indicating the completion condition of the method. Current values:
        -1: ERROR: Error on the part of the caller, e.g. an invalid parameter. In general, this means that the master/slave did not attempt to execute the action.
        0: FAILURE: Method failed to complete correctly. In general, this means that the master/slave attempted the action and failed, and there may have been side-effects as a result.
        1: SUCCESS: Method completed successfully.
        Individual methods may assign additional meaning/semantics to statusCode. 
    statusMessage (String): a human-readable string describing the return status
    value (Object): return value is further defined by individual API calls. 


Instance Variables
	elements: 		<Array>  

elements
	a 3 elements array that conforms in the format: 
{statusCode. statusMessage. value}. The elements are described above as parts of a retrun value

