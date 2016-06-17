A namespace works only for parameter holding. Each caller can push parameters in it own namespace or in the root namespace. 

Then the parameter lookup is as an inheritance, each namespace can look at it parameters and to the parents. 
The definition of a parameter in a namespace makes invisible (overrides) the parent value for the same parameter name.